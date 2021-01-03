insert into Coach(name, age, work_experience, country_id)
values ('pep guardiola', 45, 13, 1)
insert into Coach(name, age, work_experience, country_id)
values ('ronald koeman', 57, 15, 2)
insert into Coach(name, age, work_experience, country_id)
values ('valverde', 50, 17, 1)
insert into Coach(name, age, work_experience, country_id)
values ('zidane', 48, 6, 3)

insert into Country(name)
values ('spain')
insert into Country(name)
values ('netherland')
insert into Country(name)
values ('france')

insert into Reffree(name)
values('chaker')

insert into Stadium(name, capacity, city, country_id)
values('newcamp', 90000, 'barcelon', 1)
insert into Stadium(name, capacity, city, country_id)
values('santiago bernabeu', 60000, 'madrid', 1)
insert into Stadium(name, capacity, city, country_id)
values('johan cruyff arena', 45000, 'amesterdam', 2)


insert into Match(date, time, weather, stadium_id, reffree_id)
values ('2021-01-03', '23:30:00', 'rainy', 1, 1)

insert into Plays_in(team_id, match_id, is_win)
values (1,1,'not start')
insert into Plays_in(team_id, match_id, is_win)
values (3,1,'not start')

insert into Groups(name)
values('A')
insert into Groups(name)
values('B')


insert into Team(name, number_of_titles, is_eliminated, stadium_id, country_id, coach_id, group_id)
values ('barcelona', 5, 0, 1, 1, 2, 1)
insert into Team(name, number_of_titles, is_eliminated, stadium_id, country_id, coach_id, group_id)
values ('real madrid', 13, 0, 2, 1, 4, 1)


