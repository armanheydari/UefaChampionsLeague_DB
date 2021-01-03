select date, time,  name
from Team 
INNER JOIN Plays_in on Plays_in.team_id = Team.team_id
INNER JOIN Match on Plays_in.match_id = Match.match_id
where date =  convert(date ,GETDATE())