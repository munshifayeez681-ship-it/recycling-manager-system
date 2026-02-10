CREATE DATABASE IF NOT EXISTS recycling_hiring;
USE recycling_hiring;

-- Candidates table
CREATE TABLE candidates (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    experience_years INT,
    skills TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- AI evaluations table
CREATE TABLE evaluations (
    id INT AUTO_INCREMENT PRIMARY KEY,
    candidate_id INT,
    crisis_management INT,
    sustainability INT,
    team_motivation INT,
    total_score INT,
    FOREIGN KEY (candidate_id) REFERENCES candidates(id)
);

-- Rankings table
CREATE TABLE rankings (
    candidate_id INT PRIMARY KEY,
    rank_position INT,
    FOREIGN KEY (candidate_id) REFERENCES candidates(id)
);

-- Trigger to auto-calculate total score
DELIMITER //
CREATE TRIGGER calc_total_score
BEFORE INSERT ON evaluations
FOR EACH ROW
BEGIN
    SET NEW.total_score =
        NEW.crisis_management +
        NEW.sustainability +
        NEW.team_motivation;
END;
//
DELIMITER ;
