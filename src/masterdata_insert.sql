--start to import the specialisations data
insert into masterdata.specializations (name)
  select
    distinct ic.specialisation
  from
    import.candidates ic
  where
    ic.specialisation is not null and ic.specialisation not like '';


insert into masterdata.candidates (name, current_term, specializations_id)
  select
    ic.name,
    ic.current_term::int,
    s.id
  from
    import.candidates ic
  inner join masterdata.specializations s on
    ic.specialisation = s.name;

insert into masterdata.industries (name)
  select
    distinct ic.industry
  from
    import.companies ic
  where
    ic.industry is not null and ic.industry not like '';

insert into masterdata.companies (name, number_of_employees, industries_id)
  select
    ic.comapany_name,
    ic.employees::int,
    i.id
  from
    import.companies ic
  inner join masterdata.industries i on
    ic.industry = i.name;


insert into masterdata.subjects (name)
  select
    substring(column_name from position('_' in column_name)+1)
  from
    information_schema.columns
  where
    table_schema = 'import' and
    table_name = 'candidates' and
    column_name like 'grade%';

--loop and get grades for every subject and candidate
do
$$
declare

  var_row     record;

begin

  for var_row in
    select
      column_name
    from
      information_schema.columns
    where
      table_schema = 'import' and
      table_name = 'candidates' and
      column_name like 'grade%'
  loop

    execute('insert into masterdata.candidate_has_subject (grade, candidates_id, subjects_id) ' ||

      'select
        ica.' || var_row.column_name || '::int,
        mca.id,
        ms.id
      from
        import.candidates ica
      inner join masterdata.candidates mca on
        ica.name = mca.name
      inner join information_schema.columns isc on
        isc.table_schema = ''import'' and
        isc.table_name = ''candidates'' and
        isc.column_name like ''grade%''
      inner join masterdata.subjects ms on
        ms.name = substring(''' || var_row.column_name || ''' from position(''_'' in ''' || var_row.column_name || ''')+1)
      where
        isc.column_name = ''' || var_row.column_name || '''');

  end loop;

end
$$
;

--get criterias for rating a company
insert into masterdata.criterias (name)
  select
    substring(column_name from position('_' in column_name)+1)
  from
    information_schema.columns
  where
    table_schema = 'import' and
    table_name = 'rating_by_candidates' and
    column_name like 'crit_%';

--get criterias for rating a candidate
insert into masterdata.criterias (name)
  select
    substring(column_name from position('_' in column_name)+1)
  from
    information_schema.columns
  where
    table_schema = 'import' and
    table_name = 'rating_by_companies' and
    column_name like 'crit_%';

--loop and get ratings
do
$$
declare

  var_row     record;
  var_rating_row  record;
  var_rating_id int;

begin

  /*create temp table tmp_rating_with_criterias(
    ratings_id   int,
    criterias_id  int,
    rating_value  int
    );
*/
  for var_rating_row in
    select
      *
    from
      import.rating_by_candidates
  loop

    insert into masterdata.ratings (candidates_id, companies_id, direction_flag)
      select
        mcan.id,
        mcom.id,
        false
      from
        masterdata.candidates mcan
      inner join masterdata.companies mcom on
        mcan.name = var_rating_row.candidate and
        mcom.name = var_rating_row.company
    returning id into var_rating_id;

    for var_row in
      select
        column_name--substring(column_name from position('_' in column_name)+1)
      from
        information_schema.columns
      where
        table_schema = 'import' and
        table_name = 'rating_by_candidates' and
        column_name like 'crit_%'
    loop

    execute('insert into masterdata.criterias_in_ratings (ratings_id, criterias_id, rating_value)

      select
        ' || var_rating_id || ',
        mcr.id,
        irbc.' || var_row.column_name || '::int
      from
        import.rating_by_candidates irbc
      inner join information_schema.columns isc on
        isc.table_schema = ''import'' and
        isc.table_name = ''rating_by_candidates'' and
        isc.column_name like ''crit_%''
      inner join masterdata.criterias mcr on
        mcr.name = substring(''' || var_row.column_name || ''' from position(''_'' in ''' || var_row.column_name || ''')+1)
      where
        isc.column_name = ''' || var_row.column_name || ''' and
        irbc.id = ' || var_rating_row.id || '');

    end loop;

  end loop;

end
$$
;

do
$$
declare

  var_row     record;
  var_rating_row  record;
  var_rating_id int;

begin


  for var_rating_row in
    select
      *
    from
      import.rating_by_companies
  loop

    insert into masterdata.ratings (candidates_id, companies_id, direction_flag)
      select
        mcan.id,
        mcom.id,
        true
      from
        masterdata.candidates mcan
      inner join masterdata.companies mcom on
        mcan.name = var_rating_row.candidate and
        mcom.name = var_rating_row.company
    returning id into var_rating_id;

    for var_row in
      select
        column_name--substring(column_name from position('_' in column_name)+1)
      from
        information_schema.columns
      where
        table_schema = 'import' and
        table_name = 'rating_by_companies' and
        column_name like 'crit_%'
    loop

    execute('insert into masterdata.criterias_in_ratings (ratings_id, criterias_id, rating_value)

      select
        ' || var_rating_id || ',
        mcr.id,
        irbc.' || var_row.column_name || '::int
      from
        import.rating_by_companies irbc
      inner join information_schema.columns isc on
        isc.table_schema = ''import'' and
        isc.table_name = ''rating_by_companies'' and
        isc.column_name like ''crit_%''
      inner join masterdata.criterias mcr on
        mcr.name = substring(''' || var_row.column_name || ''' from position(''_'' in ''' || var_row.column_name || ''')+1)
      where
        isc.column_name = ''' || var_row.column_name || ''' and
        irbc.id = ' || var_rating_row.id || '');

    end loop;

  end loop;

end
$$
;
