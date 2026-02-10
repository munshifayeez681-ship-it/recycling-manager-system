-- =========================================================
-- Recycling Production Line Manager Selection System
-- SQL Queries File
-- =========================================================
-- This file contains:
-- 1. Database and table creation queries
-- 2. Data insertion queries for evaluations
-- 3. Final candidate ranking query
-- =========================================================


-- =========================================================
-- 1. CREATE DATABASE
-- =========================================================
CREATE DATABASE IF NOT EXISTS recycling_hiring;
USE recycling_hiring;


-- =========================================================
-- 2. CREATE CANDIDATES TABLE
-- =========================================================
CREATE TABLE candidates (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    experience_years INT NOT NULL,
    skills TEXT
);


-- =========================================================
-- 3. CREATE EVALUATIONS TABLE
-- =========================================================
CREATE TABLE evaluations (
    id INT AUTO_INCREMENT PRIMARY KEY,
    candidate_id INT NOT NULL,
    crisis_management INT CHECK (crisis_management BETWEEN 1 AND 10),
    sustainability INT CHECK (sustainability BETWEEN 1 AND 10),
    team_motivation INT CHECK (team_motivation BETWEEN 1 AND 10),
    total_score INT GENERATED ALWAYS AS
        (crisis_management + sustainability + team_motivation) STORED,
    FOREIGN KEY (candidate_id) REFERENCES candidates(id)
);


-- =========================================================
-- 4. INSERT EVALUATION SCORES FOR ALL CANDIDATES
-- =========================================================
-- Randomized scores between 1 and 10 for evaluation criteria

INSERT INTO evaluations (candidate_id, crisis_management, sustainability, team_motivation)
SELECT
    id,
    FLOOR(1 + RAND() * 10),
    FLOOR(1 + RAND() * 10),
    FLOOR(1 + RAND() * 10)
FROM candidates;


-- =========================================================
-- 5. FINAL RANKING QUERY
-- =========================================================
-- Ranks candidates based on:
-- 1. Highest total_score
-- 2. Highest experience_years (tie-breaker)

SELECT
    ROW_NUMBER() OVER (
        ORDER BY e.total_score DESC, c.experience_years DESC
    ) AS rank_position,
    c.name,
    c.experience_years,
    c.skills,
    e.crisis_management,
    e.sustainability,
    e.team_motivation,
    e.total_score
FROM candidates c
JOIN evaluations e
    ON c.id = e.candidate_id
ORDER BY rank_position;


-- =========================================================
-- END OF FILE
-- =========================================================
