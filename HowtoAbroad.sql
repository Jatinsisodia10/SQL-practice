-- Create Users table
CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    name VARCHAR(100)
);

-- Create Jobs table
CREATE TABLE Jobs (
    job_id INT PRIMARY KEY,
    title VARCHAR(100),
    company_name VARCHAR(100)
);

-- Create Job_Applications table
CREATE TABLE Job_Applications (
    id INT PRIMARY KEY,
    user_id INT,
    job_id INT,
    application_date DATE,
    status VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (job_id) REFERENCES Jobs(job_id)
);

-- Insert data into Users
INSERT INTO Users (user_id, name) VALUES
(101, 'Alice'),
(102, 'Bob');

-- Insert data into Jobs
INSERT INTO Jobs (job_id, title, company_name) VALUES
(2001, 'Frontend Dev', 'ABC Corp'),
(2002, 'Data Analyst', 'XYZ Ltd'),
(2003, 'Backend Dev', 'DEF Inc');

-- Insert data into Job_Applications
INSERT INTO Job_Applications (id, user_id, job_id, application_date, status) VALUES
(1, 101, 2001, '2024-04-01', 'applied'),
(2, 102, 2002, '2024-04-03', 'rejected'),
(3, 101, 2003, '2024-04-05', 'interview');

SELECT 
    u.name,
    ja.status,
    COUNT(*) AS total_applications
FROM 
    Job_Applications ja
JOIN 
    Users u ON ja.user_id = u.user_id
GROUP BY 
    u.name, ja.status
ORDER BY 
    u.name, ja.status;
