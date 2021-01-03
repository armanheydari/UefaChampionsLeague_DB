select date, time,  teams   /*bazi haye emruz*/
from Match
where date =  convert(date, GETDATE());
----------------------------------------------------------------------------------
select name   /*tim haye hazf nashode ra midahad*/
from Team
where is_eliminated = 0;
----------------------------------------------------------------------------------
select name, number_of_titles   /*tim ha be tartibe tedade ghahremani*/
from Team
order by number_of_titles desc;
----------------------------------------------------------------------------------------------------------------
go                                    /*jadvale amar haye fardi bazikonan bar asase post*/
create view forwards as 
select name,shirt_number,team = (select name from Team where Team.team_id = Player.team_id), assists, red_cards, yellow_cards 
from Player
where position='forward'
go
select *
from forwards
order by assists desc,red_cards asc, yellow_cards asc;

go
create view midfielders as
select name, assists, team = (select name from Team where Team.team_id = Player.team_id), succesful_tackles ,red_cards, yellow_cards   
from Player
where position='midfielder'
go
select *
from midfielders
order by assists desc, succesful_tackles desc, red_cards asc, yellow_cards asc;

go
create view deffenders as
select name, succesful_tackles, team = (select name from Team where Team.team_id = Player.team_id),red_cards, yellow_cards   
from Player
where position='deffender'
go
select *
from deffenders
order by succesful_tackles desc, red_cards asc, yellow_cards asc;

go
create view goalkeepers as
select name, saves, team = (select name from Team where Team.team_id = Player.team_id),red_cards, yellow_cards    
from Player
where position='goalkeeper'
go
select *
from goalkeepers
order by saves desc, red_cards asc, yellow_cards asc;
-------------------------------------------------------------------------------------
go								/*jadvale golzan ha*/
create view goal_scorers as
select Player.name, goals = (select COUNT(Goal.goal_id) from Goal where Goal.player_id = Player.player_id)
from Player
go
select *
from goal_scorers
Order by goals desc;
--------------------------------------------------------------------------------------
select Player.name, goals = (select COUNT(Goal.goal_id)              /*jadvale golzan ha bedune penalty*/ 
					         from Goal 
							 where Goal.player_id = Player.player_id and Goal.ispenalty=0)
from Player;
--------------------------------------------------------------------------------------
select Groups.name ,Team.name, Team.score          /*rankinge goruh ha*/
from Team
inner join Groups on Team.group_id = Groups.group_id
order by Groups.name, Team.score desc;
--------------------------------------------------------------------------------------
select Team.name,shoots = (select sum(shoots)                              /*shootzan tarin team ha*/
                           from Plays_in
						   where Team.team_id = Plays_in.team_id)
from Team
order by (select sum(shoots)       
          from Plays_in
		  where Team.team_id = Plays_in.team_id) asc;
--------------------------------------------------------------------------------------
select Team.name, goals_after_90 = (select COUNT(goal_id)            /*tedad goal haye baad az daqiqe 90*/
									from Goal, player
									where Goal.minute>90 and Goal.player_id = Player.player_id and Player.team_id = Team.team_id)
from Team;

select *
from Goal
--------------------------------------------------------------------------------------

GO									/*neveshtane liste mahrumane yek mosabeqe*/
CREATE FUNCTION fn_suspendeds(@match_teams nVARCHAR(20))
RETURNS TABLE
AS
RETURN
	SELECT Player.name
	FROM Player, Team, Match, Plays_in
	WHERE @match_teams = Match.teams and Plays_in.match_id = Match.match_id
	      and Plays_in.team_id = Team.team_id and Player.team_id = Team.team_id 
		  and (Player.yellow_cards>=3 or Player.red_cards>=1)
GO
SELECT * FROM dbo.fn_suspendeds('barcelona-real')
-------------------------------------------------------------------------------------

