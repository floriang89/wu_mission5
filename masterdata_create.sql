--create masterdata structure (normalized relational structure)

create table masterdata.specializations (
  id          serial primary key,
  name        varchar unique
);

create table masterdata.candidates (
  id            serial primary key,
  name    varchar,
  current_term  int,
  specializations_id  int,
  --rating_identities_id    int,
  --foreign key (rating_identities_id) references masterdata.rating_identities (id),
  foreign key (specializations_id) references masterdata.specializations (id)
);

create table masterdata.industries (
  id          serial primary key,
  name        varchar unique
);

create table masterdata.companies (
  id          serial primary key,
  name        varchar,
  industries_id integer,
  number_of_employees   integer,
  foreign key (industries_id) references masterdata.industries (id)
);

create table masterdata.subjects (
  id          serial primary key,
  name        varchar
);

create table masterdata.candidate_has_subject (
  id          serial primary key,
  grade       int,
  candidates_id     int,
  subjects_id       int,
  foreign key (candidates_id) references masterdata.candidates (id),
  foreign key (subjects_id) references masterdata.subjects (id)
);

create table masterdata.criterias (
  id          serial primary key,
  name        varchar
);

create table masterdata.ratings (
  id          serial primary key,
  candidates_id int,
  companies_id  int,
  created       bigint default date_part('epoch'::text, timezone('UTC-2'::text, now())),
  direction_flag  bool, --true = companies about candidates, false = candidates about companies. will provide views for that
  foreign key (candidates_id) references masterdata.candidates (id),
  foreign key (companies_id) references masterdata.companies (id)
);

create table masterdata.criterias_in_ratings (
  id            serial primary key,
  ratings_id    int,
  criterias_id  int,
  rating_value  int,
  foreign key (ratings_id) references masterdata.ratings (id),
  foreign key (criterias_id) references masterdata.criterias (id)
);

create view masterdata.v_ratings_about_companies as
  select
    r.id,
    to_timestamp(r.created) at time zone 'UTC-2' as rated_at,
    co.name as company_name,
    ca.name as student_name,
    c.name as criteria_name,
    cir.rating_value
  from
    masterdata.ratings r
  inner join masterdata.criterias_in_ratings cir on
    r.id = cir.ratings_id and
    r.direction_flag = false
  inner join masterdata.criterias c on
    cir.criterias_id = c.id
  inner join masterdata.companies co on
    r.companies_id = co.id
  inner join masterdata.candidates ca on
    r.candidates_id = ca.id;

create view masterdata.v_ratings_about_candidates as
  select
    r.id,
    to_timestamp(r.created) at time zone 'UTC-2' as rated_at,
    co.name as company_name,
    ca.name as student_name,
    c.name as criteria_name,
    cir.rating_value
  from
    masterdata.ratings r
  inner join masterdata.criterias_in_ratings cir on
    r.id = cir.ratings_id and
    r.direction_flag = true
  inner join masterdata.criterias c on
    cir.criterias_id = c.id
  inner join masterdata.companies co on
    r.companies_id = co.id
  inner join masterdata.candidates ca on
    r.candidates_id = ca.id;