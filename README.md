# Champions League SQL Database

> A fully relational T-SQL database modelling UEFA Champions League data — covering teams, players, matches, goals, referees, and commentators — with a library of analytical queries and table-valued functions.

[![SQL Server](https://img.shields.io/badge/SQL%20Server-T--SQL-blue.svg)](https://www.microsoft.com/en-us/sql-server)

## 📌 Overview

This project implements a normalized relational database schema for a UEFA Champions League tournament. It models the full lifecycle of a competition: group-stage standings, individual match events, player statistics by position, and operational data like referee assignments and broadcast commentators. The schema is ready to deploy on Microsoft SQL Server and comes with seed data and a comprehensive query suite.

Beyond the schema, `Queries.sql` demonstrates a range of SQL techniques — views for per-position player rankings, correlated subqueries for goal and shot aggregation, table-valued functions for on-demand lookups, and group-stage leaderboard construction — making it a practical reference for relational database design patterns applied to a real-world sports domain.

## ✨ Key Features

* **Normalized relational schema:** Thirteen tables with enforced foreign keys spanning Country, Team, Player, Match, Goal, Stadium, Coach, Referee, Commentator, and Groups — with `CHECK` constraints on player age and shirt number.
* **Per-position player views:** Four SQL views (`forwards`, `midfielders`, `defenders`, `goalkeepers`) each sorted by the most relevant performance stat — assists, tackles, saves — with disciplinary record as a tiebreaker.
* **Goal and match analytics:** Correlated subqueries aggregating goals per player (including a penalty-excluded variant), goals scored after the 90th minute per team, and total shots per team across all matches.
* **Table-valued functions:** `fn_suspendeds` returns the suspended players for a given fixture (3+ yellows or 1 red); `fn_Reffree_info` returns the referee panel for a match; `fn_Team_info` returns team standings by name — all parameterized and reusable.
* **Group-stage leaderboard:** A join across `Team` and `Groups` ordered by group name and team score, reflecting live elimination status via the `is_eliminated` flag.
* **Seed data included:** `insert data.sql` populates all tables so the schema runs end-to-end without manual data entry.

## 🛠️ Tech Stack

* **Core Language:** T-SQL
* **Database:** Microsoft SQL Server

## 🚀 Getting Started

### Prerequisites

Microsoft SQL Server (any recent edition) or SQL Server Express.

### Installation

```bash
git clone https://github.com/armanheydari/UefaChampionsLeague_DB.git
cd UefaChampionsLeague_DB
```

Open SQL Server Management Studio (SSMS) or Azure Data Studio, then run the files in order:

```sql
-- 1. Create the database and all tables
-- Run: CreateDataBase.sql

-- 2. Populate with sample data
-- Run: insert data.sql

-- 3. Execute analytical queries and create views/functions
-- Run: Queries.sql
```

## 💻 Usage

```sql
-- Top goal scorers across all matches
SELECT * FROM goal_scorers ORDER BY goals DESC;

-- Group stage standings
SELECT Groups.name, Team.name, Team.score
FROM Team
INNER JOIN Groups ON Team.group_id = Groups.group_id
ORDER BY Groups.name, Team.score DESC;

-- Suspended players for a specific match
SELECT * FROM dbo.fn_suspendeds('barcelona-real');

-- Referee panel for a match
SELECT * FROM fn_Reffree_info('barca-real');
```

## 📁 Project Structure

```
UefaChampionsLeague_DB/
├── CreateDataBase.sql      # Schema: all CREATE TABLE statements with constraints and FK relationships
├── insert data.sql         # Seed data for all tables
├── Queries.sql             # Views, functions, and analytical queries
└── faze 2(ER).jpg          # Entity-Relationship diagram
```
