Recycling Production Line Manager Selection System
 Project Overview

This project is a database-driven candidate evaluation and ranking system designed to assist in selecting the most suitable Recycling Production Line Manager.
It simulates real-world hiring by combining experience, skills, and evaluation scores to generate a ranked list of candidates.

The system stores candidate data in a relational database, assigns evaluation scores programmatically, and ranks candidates based on total performance metrics.

 Objectives

Store structured candidate data in a database

Simulate candidate evaluations using predefined criteria

Calculate total scores automatically

Rank candidates based on performance

Display top candidates for hiring decisions

 Tech Stack

Node.js – Data generation

MySQL – Database and querying

SQL – Ranking and scoring logic

 Database Schema
1. candidates Table

Stores basic candidate information.

Column Name	Description
id	Unique candidate ID
name	Candidate name
experience_years	Years of professional experience
skills	Relevant skill set
2. evaluations Table

Stores evaluation scores for each candidate.

Column Name	Description
id	Evaluation ID
candidate_id	Reference to candidates table
crisis_management	Crisis handling score (1–10)
sustainability	Sustainability knowledge score (1–10)
team_motivation	Team leadership score (1–10)
total_score	Sum of all evaluation scores
 Data Generation

A Node.js script (generateCandidates.js) was used to generate 40 candidate records

Evaluation scores were randomly generated between 1 and 10

Each candidate is evaluated on:

Crisis Management

Sustainability Planning

Team Motivation

 Scoring Logic

Each candidate’s total score is calculated as:

total_score = crisis_management + sustainability + team_motivation


Candidates are ranked based on:

Total score (descending)

Experience years (descending)

 Ranking Output

The final ranking displays:

Rank position

Candidate name

Years of experience

Skills

Individual evaluation scores

Total score

This allows quick identification of the most suitable candidates for the managerial role.

 Sample Result

40 candidates successfully evaluated

Rankings generated using SQL

Top candidates identified based on combined metrics

 Key Features

Automated candidate scoring

SQL-based ranking logic

Realistic hiring simulation

Scalable database design

 Future Enhancements

Web dashboard for visual ranking

Weighted scoring system

AI-generated candidate summaries

CSV or PDF export of results

 Author

Fayeez Munshi