CREATE DATABASE UCL2;

CREATE TABLE Country  (
    country_id  int IDENTITY(1, 1) NOT NULL,
    name nvarchar(150) NOT NULL,
    continent  nvarchar(150) ,
    PRIMARY KEY (country_id),
);

CREATE TABLE Coach (
    coach_id int IDENTITY(1, 1) NOT NULL,
    name nvarchar(150) NOT NULL,
    age int ,
	work_experience int ,
	country_id int,
    PRIMARY KEY (coach_id),
    FOREIGN KEY (country_id) REFERENCES Country(country_id)
);

CREATE TABLE Commentator  (
    commentator_id int IDENTITY(1, 1) NOT NULL,
    name nvarchar(150) NOT NULL,
	channel nvarchar ,
    language  nvarchar(150) ,
    PRIMARY KEY (commentator_id),
);

CREATE TABLE Groups (
	group_id int IDENTITY(1, 1) NOT NULL,
	name char(1) ,
	PRIMARY KEY (group_id),
);

CREATE TABLE Reffree  (
    reffree_id int IDENTITY(1, 1) NOT NULL,
    name nvarchar(150) NOT NULL,
	age INT,
	weight INT,
	judged_matched INT,
    PRIMARY KEY (reffree_id)
);

CREATE TABLE Stadium  (
    stadium_id int IDENTITY(1, 1) NOT NULL,
    name nvarchar(150) NOT NULL,
	capacity INT,
    city nvarchar(20),
	country_id int not null,
    PRIMARY KEY (stadium_id),
	FOREIGN KEY (country_id) REFERENCES Country(country_id)
);

CREATE TABLE Team(
    team_id INT PRIMARY KEY IDENTITY (1, 1),
    name nVARCHAR (150) NOT NULL,
	number_of_titles INT,
	stablished_year date,
	is_eliminated bit NOT null default 0,
	score int not null default 0,
	stadium_id INT,
	country_id INT,
	coach_id INT,
	group_id INT,
    FOREIGN KEY (stadium_id) REFERENCES Stadium(stadium_id),
	FOREIGN KEY (country_id) REFERENCES Country(country_id),
	FOREIGN KEY (group_id) REFERENCES Groups(group_id),
	FOREIGN KEY (coach_id) REFERENCES Coach(coach_id)
);

CREATE TABLE Player(
    player_id INT PRIMARY KEY IDENTITY (1, 1),
    name VARCHAR (50) NOT NULL,
    age INT CHECK (age>=15 and age<=50),
	height INT,
	weight INT,
	shirt_number INT not null check(shirt_number>0 and shirt_number < 100),
	assists INT,
	saves INT,
	succesful_tackles INT,
	yellow_cards INT,
	red_cards INT,
	position VARCHAR (20) not null,
	team_id INT,
	country_id INT,
    FOREIGN KEY (team_id) REFERENCES Team(team_id),
	FOREIGN KEY (country_id) REFERENCES Country(country_id)
);

CREATE TABLE Match  (
    match_id int IDENTITY(1, 1) NOT NULL,
	weather nvarchar(20),
	time time(7),
	date date,
	result nvarchar(10),
	stadium_id int NOT NULL,
	is_in_group bit default 1,
	is_done bit default 0,
    PRIMARY KEY (match_id),
	FOREIGN KEY (stadium_id) REFERENCES Stadium(stadium_id),
);

CREATE TABLE Report_by(
    commentator_id INT not null,
    match_id INT not null,	
    FOREIGN KEY (commentator_id) REFERENCES Commentator(commentator_id),
	FOREIGN KEY (match_id) REFERENCES Match(match_id)
);

CREATE TABLE Plays_in(
    team_id INT not null,
    match_id INT not null,	
	offsides INT,
    shoots INT,
    passes INT,
	yellow_cards INT,
	red_cards INT,
	foals INT,
	is_win VARCHAR(10) not null default 'equal',
    FOREIGN KEY (team_id) REFERENCES Team(team_id),
	FOREIGN KEY (match_id) REFERENCES Match(match_id)
);

CREATE TABLE Goal  (
    goal_id int IDENTITY(1, 1) NOT NULL,
	minute int ,
	ispenalty bit NOT NULL,
	is_own_goal bit NOT NULL,
	player_id int NOT NULL,
	match_id int NOT NULL,
    PRIMARY KEY (goal_id),
	FOREIGN KEY (player_id) REFERENCES Player(player_id),
	FOREIGN KEY (match_id) REFERENCES Match(match_id)
);

CREATE TABLE judge_by(
    reffree_id INT not null,
    match_id INT not null,	
    FOREIGN KEY (reffree_id) REFERENCES Reffree(reffree_id),
	FOREIGN KEY (match_id) REFERENCES Match(match_id)
);


