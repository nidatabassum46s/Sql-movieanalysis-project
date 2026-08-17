# Movie Ratings Analysis with SQL

A SQL project analyzing the MovieLens dataset to answer real analytical
questions about movies, ratings, and user behavior — using joins,
aggregations, and a self-join.

## Overview

This project takes a raw, real-world dataset and turns it into an
organized database, then uses SQL to extract insights from it — the
same core workflow a data analyst uses on the job: **get data → structure
it → query it → find answers.**

## Dataset

**[MovieLens (ml-latest-small)](https://grouplens.org/datasets/movielens/)**
— a public dataset from GroupLens Research.

| Table | Rows | Description |
|---|---|---|
| `movies` | 9,742 | Movie ID, title, genres |
| `ratings` | 100,836 | User ratings (1–5 stars) |
| `tags` | 3,683 | User-added descriptive tags |
| `links` | 9,742 | IMDb / TMDb reference IDs |

## Tools Used

- **MySQL Workbench** — database setup and querying
- **SQL** — data loading (`LOAD DATA INFILE`), joins, aggregation,
  filtering, and window functions

## Questions Answered

| # | Question | SQL Concepts Used |
|---|---|---|
| 1 | Top 10 highest-rated movies (min. 50 ratings) | JOIN, GROUP BY, HAVING |
| 2 | Most common tags used by viewers | GROUP BY, aggregation |
| 3 | Average rating for Comedy movies | JOIN, filtering (LIKE) |
| 4 | Movies that are both Comedy and Romance | Multiple WHERE conditions |
| 5 | Most active users | GROUP BY, aggregation |
| 6 | "Funny"-tagged movies and their average rating | Multi-table JOIN, window function |
| 7 | Movie pairs loved (5★) by the same users | Self-join |

All queries are in [`queries.sql`](./queries.sql).

## Example Insight

Query #7 uncovers movie pairs that share the most 5-star fans — the same
logic behind "people who liked this also liked..." recommendation
systems. For example, users who gave *Star Wars: Episode IV* a perfect
rating overwhelmingly also gave *Star Wars: Episode V* one too.

## What This Project Demonstrates

- Structuring raw CSV data into a relational database
- Writing multi-table JOINs, including a self-join
- Aggregate functions (`AVG`, `COUNT`) with `GROUP BY` / `HAVING`
- Window functions (`OVER (PARTITION BY ...)`)
- Translating a business-style question into a working SQL query

## Files in This Repo

- `queries.sql` — all 7 queries, ready to run
- `README.md` — this file
- `screenshots/` — sample query results

---

*Project built as part of my data analytics learning journey, working
toward an entry-level data analyst role.*
