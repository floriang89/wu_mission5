--create import tables to insert the provided data

create table import.companies
(
    id integer primary key not null,
    comapany_name text,
    industry text,
    employees text
);

create table import.candidates
(
    id integer primary key not null,
    name text,
    current_term text,
    grade_accounting text,
    grade_management text,
    grade_economics text,
    grade_statistics text,
    grade_information_systems text,
    specialisation text
);

create table import.rating_by_candidates
(
    id integer primary key not null,
    company text,
    candidate text,
    crit_interesting_activity text,
    crit_helpful_mentoring text
);

create table import.rating_by_companies
(
    id integer primary key not null,
    company text,
    candidate text,
    crit_knowledge text,
    crit_engagemet text,
    crit_team_work text
);