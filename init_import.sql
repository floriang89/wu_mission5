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

--insert provided data

--companies
INSERT INTO import.companies (comapany_name, industry, employees) VALUES ('fase-high', 'transportation', '2300');
INSERT INTO import.companies (comapany_name, industry, employees) VALUES ('Faxline', 'service', '100');
INSERT INTO import.companies (comapany_name, industry, employees) VALUES ('konflex', 'health care', '2600');
INSERT INTO import.companies (comapany_name, industry, employees) VALUES ('Inaplux', 'logictics', '23600');
INSERT INTO import.companies (comapany_name, industry, employees) VALUES ('Redrill', 'consulting', '4500');
INSERT INTO import.companies (comapany_name, industry, employees) VALUES ('Donkix', 'consulting', '9800');
INSERT INTO import.companies (comapany_name, industry, employees) VALUES ('Lane-technology', 'consulting', '150');
INSERT INTO import.companies (comapany_name, industry, employees) VALUES ('Daltronhex', 'logictics', '450');
INSERT INTO import.companies (comapany_name, industry, employees) VALUES ('blackline', 'service', '850');
INSERT INTO import.companies (comapany_name, industry, employees) VALUES ('Aptankix', 'service', '50');
INSERT INTO import.companies (comapany_name, industry, employees) VALUES ('Siliconphase', 'service', '14000');
INSERT INTO import.companies (comapany_name, industry, employees) VALUES ('Ventola', 'health care', '9500');
INSERT INTO import.companies (comapany_name, industry, employees) VALUES ('goodtom', 'transportation', '550');
INSERT INTO import.companies (comapany_name, industry, employees) VALUES ('Pluslam', 'transportation', '400');

--candidates
INSERT INTO import.candidates (name, current_term, grade_accounting, grade_management, grade_economics, grade_statistics, grade_information_systems, specialisation) VALUES ('Anna Sanders', '4', '100', '34', '74', '92', '94', 'Strategic Management');
INSERT INTO import.candidates (name, current_term, grade_accounting, grade_management, grade_economics, grade_statistics, grade_information_systems, specialisation) VALUES ('Jesse Lopez', '5', '25', '97', '32', '100', '64', 'Entrepreneurship and Innovation');
INSERT INTO import.candidates (name, current_term, grade_accounting, grade_management, grade_economics, grade_statistics, grade_information_systems, specialisation) VALUES ('Cheryl Robinson', '6', '100', '41', '100', '32', '88', 'New Media');
INSERT INTO import.candidates (name, current_term, grade_accounting, grade_management, grade_economics, grade_statistics, grade_information_systems, specialisation) VALUES ('Albert Green', '5', '80', '87', '79', '6', '100', 'Econometrics');
INSERT INTO import.candidates (name, current_term, grade_accounting, grade_management, grade_economics, grade_statistics, grade_information_systems, specialisation) VALUES ('Donald Ramirez', '6', '22', '96', '96', '71', '91', 'Finance and Accounting');
INSERT INTO import.candidates (name, current_term, grade_accounting, grade_management, grade_economics, grade_statistics, grade_information_systems, specialisation) VALUES ('Marie Allen', '4', '95', '12', '88', '100', '32', 'Economics');
INSERT INTO import.candidates (name, current_term, grade_accounting, grade_management, grade_economics, grade_statistics, grade_information_systems, specialisation) VALUES ('Margaret Lewis', '5', '80', '98', '98', '98', '36', 'Strategic Management');
INSERT INTO import.candidates (name, current_term, grade_accounting, grade_management, grade_economics, grade_statistics, grade_information_systems, specialisation) VALUES ('Evelyn Mitchell', '6', '12', '51', '95', '69', '100', 'Entrepreneurship and Innovation');
INSERT INTO import.candidates (name, current_term, grade_accounting, grade_management, grade_economics, grade_statistics, grade_information_systems, specialisation) VALUES ('Michelle Morgan', '5', '99', '58', '97', '100', '70', 'New Media');
INSERT INTO import.candidates (name, current_term, grade_accounting, grade_management, grade_economics, grade_statistics, grade_information_systems, specialisation) VALUES ('Wanda Rodriguez', '7', '64', '100', '98', '93', '94', 'Econometrics');
INSERT INTO import.candidates (name, current_term, grade_accounting, grade_management, grade_economics, grade_statistics, grade_information_systems, specialisation) VALUES ('Sara Lee', '8', '43', '39', '99', '63', '82', 'Finance and Accounting');
INSERT INTO import.candidates (name, current_term, grade_accounting, grade_management, grade_economics, grade_statistics, grade_information_systems, specialisation) VALUES ('Angela Young', '5', '96', '67', '32', '100', '43', 'Economics');
INSERT INTO import.candidates (name, current_term, grade_accounting, grade_management, grade_economics, grade_statistics, grade_information_systems, specialisation) VALUES ('Clarence Patterson', '4', '97', '99', '100', '91', '100', 'Strategic Management');
INSERT INTO import.candidates (name, current_term, grade_accounting, grade_management, grade_economics, grade_statistics, grade_information_systems, specialisation) VALUES ('Russell Gonzales', '9', '79', '84', '100', '27', '70', 'Entrepreneurship and Innovation');
INSERT INTO import.candidates (name, current_term, grade_accounting, grade_management, grade_economics, grade_statistics, grade_information_systems, specialisation) VALUES ('Gary Edwards', '6', '90', '100', '97', '99', '9', 'New Media');
INSERT INTO import.candidates (name, current_term, grade_accounting, grade_management, grade_economics, grade_statistics, grade_information_systems, specialisation) VALUES ('Diana Bennett', '5', '96', '66', '99', '64', '100', 'Econometrics');
INSERT INTO import.candidates (name, current_term, grade_accounting, grade_management, grade_economics, grade_statistics, grade_information_systems, specialisation) VALUES ('Louis Ross', '9', '100', '100', '96', '100', '6', 'Finance and Accounting');
INSERT INTO import.candidates (name, current_term, grade_accounting, grade_management, grade_economics, grade_statistics, grade_information_systems, specialisation) VALUES ('Jerry Reed', '10', '78', '99', '66', '84', '99', 'Economics');
INSERT INTO import.candidates (name, current_term, grade_accounting, grade_management, grade_economics, grade_statistics, grade_information_systems, specialisation) VALUES ('Jose Torres', '6', '30', '56', '100', '6', '89', 'Strategic Management');
INSERT INTO import.candidates (name, current_term, grade_accounting, grade_management, grade_economics, grade_statistics, grade_information_systems, specialisation) VALUES ('Juan Nelson', '11', '97', '59', '100', '32', '93', 'Entrepreneurship and Innovation');
INSERT INTO import.candidates (name, current_term, grade_accounting, grade_management, grade_economics, grade_statistics, grade_information_systems, specialisation) VALUES ('William Walker', '12', '59', '83', '97', '86', '79', 'New Media');
INSERT INTO import.candidates (name, current_term, grade_accounting, grade_management, grade_economics, grade_statistics, grade_information_systems, specialisation) VALUES ('Raymond Wright', '5', '45', '77', '100', '79', '93', 'Econometrics');
INSERT INTO import.candidates (name, current_term, grade_accounting, grade_management, grade_economics, grade_statistics, grade_information_systems, specialisation) VALUES ('Helen Cox', '4', '97', '87', '67', '99', '56', 'Finance and Accounting');
INSERT INTO import.candidates (name, current_term, grade_accounting, grade_management, grade_economics, grade_statistics, grade_information_systems, specialisation) VALUES ('Theresa Moore', '3', '49', '93', '9', '99', '100', 'Economics');
INSERT INTO import.candidates (name, current_term, grade_accounting, grade_management, grade_economics, grade_statistics, grade_information_systems, specialisation) VALUES ('Carlos Kelly', '5', '49', '78', '88', '76', '22', 'New Media');

--rating by candidates
INSERT INTO import.rating_by_candidates (company, candidate, crit_interesting_activity, crit_helpful_mentoring) VALUES ('fase-high', 'Beverly Flores', '5', '3');
INSERT INTO import.rating_by_candidates (company, candidate, crit_interesting_activity, crit_helpful_mentoring) VALUES ('Faxline', 'Charles Harris', '5', '4');
INSERT INTO import.rating_by_candidates (company, candidate, crit_interesting_activity, crit_helpful_mentoring) VALUES ('konflex', 'Jacqueline Lopez', '2', '2');
INSERT INTO import.rating_by_candidates (company, candidate, crit_interesting_activity, crit_helpful_mentoring) VALUES ('Inaplux', 'Barbara King', '5', '2');
INSERT INTO import.rating_by_candidates (company, candidate, crit_interesting_activity, crit_helpful_mentoring) VALUES ('Redrill', 'Walter Washington', '2', '5');
INSERT INTO import.rating_by_candidates (company, candidate, crit_interesting_activity, crit_helpful_mentoring) VALUES ('Donkix', 'Eric Bennett', '5', '4');
INSERT INTO import.rating_by_candidates (company, candidate, crit_interesting_activity, crit_helpful_mentoring) VALUES ('Lane-technology', 'John Martinez', '5', '5');
INSERT INTO import.rating_by_candidates (company, candidate, crit_interesting_activity, crit_helpful_mentoring) VALUES ('Daltronhex', 'Gregory Baker', '5', '2');
INSERT INTO import.rating_by_candidates (company, candidate, crit_interesting_activity, crit_helpful_mentoring) VALUES ('blackline', 'Julia Bell', '3', '2');
INSERT INTO import.rating_by_candidates (company, candidate, crit_interesting_activity, crit_helpful_mentoring) VALUES ('Aptankix', 'Shirley Robinson', '4', '5');
INSERT INTO import.rating_by_candidates (company, candidate, crit_interesting_activity, crit_helpful_mentoring) VALUES ('Siliconphase', 'Cheryl White', '5', '5');
INSERT INTO import.rating_by_candidates (company, candidate, crit_interesting_activity, crit_helpful_mentoring) VALUES ('Ventola', 'Carl Diaz', '0', '0');
INSERT INTO import.rating_by_candidates (company, candidate, crit_interesting_activity, crit_helpful_mentoring) VALUES ('goodtom', 'Richard Lee', '5', '5');
INSERT INTO import.rating_by_candidates (company, candidate, crit_interesting_activity, crit_helpful_mentoring) VALUES ('Pluslam', 'Kimberly Johnson', '2', '5');
INSERT INTO import.rating_by_candidates (company, candidate, crit_interesting_activity, crit_helpful_mentoring) VALUES ('Aptankix', 'Ruby Price', '5', '4');
INSERT INTO import.rating_by_candidates (company, candidate, crit_interesting_activity, crit_helpful_mentoring) VALUES ('Siliconphase', 'Carlos Coleman', '5', '4');
INSERT INTO import.rating_by_candidates (company, candidate, crit_interesting_activity, crit_helpful_mentoring) VALUES ('Ventola', 'Alice Jones', '4', '2');
INSERT INTO import.rating_by_candidates (company, candidate, crit_interesting_activity, crit_helpful_mentoring) VALUES ('goodtom', 'Jessica Perry', '5', '4');
INSERT INTO import.rating_by_candidates (company, candidate, crit_interesting_activity, crit_helpful_mentoring) VALUES ('fase-high', 'Frances Carter', '5', '5');
INSERT INTO import.rating_by_candidates (company, candidate, crit_interesting_activity, crit_helpful_mentoring) VALUES ('Faxline', 'Ann Watson', '5', '3');
INSERT INTO import.rating_by_candidates (company, candidate, crit_interesting_activity, crit_helpful_mentoring) VALUES ('konflex', 'Jason Gonzales', '3', '5');

--rating by companiesINSERT INTO import.rating_by_companies (company, candidate, crit_knowledge, crit_engagemet, crit_team_work) VALUES ('fase-high', 'Beverly Flores', '5', '3', '2');
INSERT INTO import.rating_by_companies (company, candidate, crit_knowledge, crit_engagemet, crit_team_work) VALUES ('Faxline', 'Charles Harris', '5', '3', '5');
INSERT INTO import.rating_by_companies (company, candidate, crit_knowledge, crit_engagemet, crit_team_work) VALUES ('konflex', 'Jacqueline Lopez', '4', '5', '2');
INSERT INTO import.rating_by_companies (company, candidate, crit_knowledge, crit_engagemet, crit_team_work) VALUES ('Inaplux', 'Barbara King', '0', '2', '5');
INSERT INTO import.rating_by_companies (company, candidate, crit_knowledge, crit_engagemet, crit_team_work) VALUES ('Redrill', 'Walter Washington', '5', '3', '0');
INSERT INTO import.rating_by_companies (company, candidate, crit_knowledge, crit_engagemet, crit_team_work) VALUES ('Donkix', 'Eric Bennett', '5', '5', '5');
INSERT INTO import.rating_by_companies (company, candidate, crit_knowledge, crit_engagemet, crit_team_work) VALUES ('Lane-technology', 'John Martinez', '0', '4', '4');
INSERT INTO import.rating_by_companies (company, candidate, crit_knowledge, crit_engagemet, crit_team_work) VALUES ('Daltronhex', 'Gregory Baker', '0', '5', '5');
INSERT INTO import.rating_by_companies (company, candidate, crit_knowledge, crit_engagemet, crit_team_work) VALUES ('blackline', 'Julia Bell', '2', '5', '2');
INSERT INTO import.rating_by_companies (company, candidate, crit_knowledge, crit_engagemet, crit_team_work) VALUES ('Aptankix', 'Shirley Robinson', '2', '5', '2');
INSERT INTO import.rating_by_companies (company, candidate, crit_knowledge, crit_engagemet, crit_team_work) VALUES ('Siliconphase', 'Cheryl White', '4', '3', '2');
INSERT INTO import.rating_by_companies (company, candidate, crit_knowledge, crit_engagemet, crit_team_work) VALUES ('Ventola', 'Carl Diaz', '5', '4', '2');
INSERT INTO import.rating_by_companies (company, candidate, crit_knowledge, crit_engagemet, crit_team_work) VALUES ('goodtom', 'Richard Lee', '4', '5', '2');
INSERT INTO import.rating_by_companies (company, candidate, crit_knowledge, crit_engagemet, crit_team_work) VALUES ('Pluslam', 'Kimberly Johnson', '3', '0', '2');
INSERT INTO import.rating_by_companies (company, candidate, crit_knowledge, crit_engagemet, crit_team_work) VALUES ('Aptankix', 'Ruby Price', '3', '5', '5');
INSERT INTO import.rating_by_companies (company, candidate, crit_knowledge, crit_engagemet, crit_team_work) VALUES ('Siliconphase', 'Carlos Coleman', '0', '5', '3');
INSERT INTO import.rating_by_companies (company, candidate, crit_knowledge, crit_engagemet, crit_team_work) VALUES ('Ventola', 'Alice Jones', '3', '3', '3');
INSERT INTO import.rating_by_companies (company, candidate, crit_knowledge, crit_engagemet, crit_team_work) VALUES ('goodtom', 'Jessica Perry', '2', '2', '0');
INSERT INTO import.rating_by_companies (company, candidate, crit_knowledge, crit_engagemet, crit_team_work) VALUES ('fase-high', 'Frances Carter', '2', '4', '5');
INSERT INTO import.rating_by_companies (company, candidate, crit_knowledge, crit_engagemet, crit_team_work) VALUES ('Faxline', 'Ann Watson', '2', '4', '5');
INSERT INTO import.rating_by_companies (company, candidate, crit_knowledge, crit_engagemet, crit_team_work) VALUES ('konflex', 'Jason Gonzales', '3', '4', '5');