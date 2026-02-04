# SQL Omnichannel Sales Analytics Project

## Overview
This project analyzes customer purchasing behavior across online and offline sales channels using PostgreSQL.
The goal is to identify high-value customers, cross-channel behavior, and product performance trends.

## Tech Stack
- PostgreSQL
- SQL (joins, CTEs, aggregations, set operations)

## Dataset
- 51 customers
- 400+ orders
- Time period: January–April
- Channels: Online & Offline

## Business Questions Answered
- Who are the top-spending customers?
- Which products sell across both online and offline channels?
- How does average order value differ by channel?
- Which customers consistently exceed offline average spend?
- How do high-value buyers trend over time?

## Project Structure
- /sql – analytical SQL queries (one question per file)
- /insights – summarized business findings

## Key Insights
- Top customer total spend exceeded 670,000
- 25 products were sold in both online and offline channels
- Offline AOV is significantly higher than online
- High-value buyers show seasonal clustering by month

## How to Run
Queries are written for PostgreSQL and can be executed independently.
