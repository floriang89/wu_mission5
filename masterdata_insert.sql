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

select
    *--mcan.id,
--     mcom.id,
--     false
  from
    import.rating_by_candidates irbc
  inner join masterdata.candidates mcan on
    irbc.candidate = mcan.name
  inner join masterdata.companies mcom on
    irbc.company = mcom.name