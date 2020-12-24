CREATE DATABASE UCL;
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