CREATE DATABASE UCL;

CREATE TABLE Country  (
    country_id  int IDENTITY(1, 1) NOT NULL,
    name nvarchar(150) NOT NULL,
    continent  nvarchar(150) ,
    PRIMARY KEY (country_id),
);
CREATE TABLE Player(
    player_id INT PRIMARY KEY IDENTITY (1, 1),
    name VARCHAR (50) NOT NULL,
    age INT,
	height INT,
	weight INT,
	shirt_number INT not null,
	assists INT,
	saves INT,
	succesful_tackles INT,
	yellow_cards INT,
	red_cards INT,
	position VARCHAR (20) not null,
	team_id INT,
	country_id INT,
    FOREIGN KEY (team_id) REFERENCES Team(team_id),
	FOREIGN KEY (country_id) REFERENCES Country(country_id),
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

CREATE TABLE Match  (
    match_id int IDENTITY(1, 1) NOT NULL,
	weather nvarchar(20),
	time time(7),
	date date,
	result nvarchar(10),
	stadium_id int NOT NULL,
	reffree_id int NOT NULL,
    PRIMARY KEY (match_id),
	FOREIGN KEY (stadium_id) REFERENCES Stadium(stadium_id),
	FOREIGN KEY (reffree_id) REFERENCES Reffree(reffree_id)

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

CREATE TABLE Groups (
	group_id int IDENTITY(1, 1) NOT NULL,
	name char(1),
	PRIMARY KEY (group_id),



)