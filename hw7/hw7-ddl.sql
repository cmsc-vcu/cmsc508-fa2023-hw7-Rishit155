# hw7-ddl.sql

# Section 1
SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS peopleroles;
DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS peopleskills;
DROP TABLE IF EXISTS skills;
DROP TABLE IF EXISTS people;
SET FOREIGN_KEY_CHECKS=1;

# Section 2
CREATE TABLE skills (
    skill_id int,
    skill_name varchar(255) NOT NULL,
    skill_description varchar(4096) NOT NULL,
    skill_tag varchar(255) NOT NULL,
    skill_url varchar(4096) DEFAULT NULL,
    time_commitment varchar(255) DEFAULT NULL,
    PRIMARY KEY (skill_id)
);

# Section 3
INSERT INTO skills (skill_id, skill_name, skill_description, skill_tag) VALUES
(1, 'Coding Magic', 'Master the art of coding with a touch of magic.', 'Skill 1'),
(2, 'Data Wizardry', 'Unleash the power of data through wizardry.', 'Skill 2'),
(3, 'Design Elegance', 'Craft visually stunning and elegant designs.', 'Skill 3'),
(4, 'Problem Solving', 'Solve complex problems with ease and creativity.', 'Skill 4'),
(5, 'Communication Mastery', 'Master the art of effective communication.', 'Skill 5'),
(6, 'Leadership Excellence', 'Lead with excellence and inspire teams.', 'Skill 6');

# Section 4
CREATE TABLE people (
    people_id int,
    people_first_name varchar(256) DEFAULT NULL,
    people_last_name varchar(256) NOT NULL,
    people_email varchar(4096) DEFAULT NULL,
    people_linkedin_url varchar(4096) DEFAULT NULL,
    people_headshot_url varchar(4096) DEFAULT NULL,
    people_discord_handle varchar(512) DEFAULT NULL,
    people_brief_bio TEXT DEFAULT NULL,
    people_date_joined date NOT NULL,
    PRIMARY KEY (people_id)
);

# Section 5
INSERT INTO people (people_id, people_last_name, people_date_joined) VALUES
(1, 'Person 1', '2023-01-01'),
(2, 'Person 2', '2023-02-01'),
(3, 'Person 3', '2023-03-01');

# Section 6
CREATE TABLE peopleskills (
    people_skill_id int AUTO_INCREMENT,
    skills_id int NOT NULL,
    people_id int NOT NULL,
    date_acquired date NOT NULL,
    PRIMARY KEY (people_skill_id),
    FOREIGN KEY (skills_id) REFERENCES skills(skill_id),
    FOREIGN KEY (people_id) REFERENCES people(people_id)
);

# Section 7
INSERT INTO peopleskills (skills_id, people_id, date_acquired) VALUES
(1, 1, '2023-01-02'),
(3, 1, '2023-02-15'),
(6, 1, '2023-03-20'),
(4, 2, '2022-05-15');
-- -- Continue with similar entries for other people and skills

# Section 8
CREATE TABLE roles (
    role_id int,
    role_name varchar(255) NOT NULL,
    sort_priority int NOT NULL,
    PRIMARY KEY (role_id)
);

# Section 9
INSERT INTO roles (role_id, role_name, sort_priority) VALUES
(1, 'Designer', 10),
(2, 'Developer', 20),
(3, 'Recruit', 30),
(4, 'Team Lead', 40),
(5, 'Boss', 50),
(6, 'Mentor', 60);

# Section 10
CREATE TABLE peopleroles (
    people_role_id int AUTO_INCREMENT,
    people_id int NOT NULL,
    role_id int NOT NULL,
    date_assigned date NOT NULL,
    PRIMARY KEY (people_role_id),
    FOREIGN KEY (people_id) REFERENCES people(people_id),
    FOREIGN KEY (role_id) REFERENCES roles(role_id)
);

# Section 11
INSERT INTO peopleroles (people_id, role_id, date_assigned) VALUES
(1, 2, '2023-01-02'), -- Person 1 as Developer
(2, 5, '2023-01-05'), -- Person 2 as Boss
(3, 2, '2023-01-10'); -- Person 3 as Developer
-- -- Continue with similar entries for other people and roles
