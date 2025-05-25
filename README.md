Here’s a **README.md** file you can use for your GitHub repository based on the SQL task you've described:

```markdown
# 📊 SQL Job Applications Tracker

This project demonstrates SQL queries for analyzing job application data. It includes schema creation, data insertion, and aggregation logic to generate insights from user application activity.

---

## 🗂️ Tables

- **Users**: Stores user details.
- **Jobs**: Contains job listing information.
- **Job_Applications**: Tracks applications submitted by users.

---

## ✅ Objective

Write a SQL query to return the **number of job applications submitted by each user**, grouped by **application status**.

### 📌 Expected Output

```

| name  | status    | total\_applications |
| ----- | --------- | ------------------- |
| Alice | applied   | 1                   |
| Alice | interview | 1                   |
| Bob   | rejected  | 1                   |

````

---

## 🛠️ SQL Setup

### 1. Create Tables

```sql
CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE Jobs (
    job_id INT PRIMARY KEY,
    title VARCHAR(100),
    company_name VARCHAR(100)
);

CREATE TABLE Job_Applications (
    id INT PRIMARY KEY,
    user_id INT,
    job_id INT,
    application_date DATE,
    status VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (job_id) REFERENCES Jobs(job_id)
);
````

### 2. Insert Data

```sql
INSERT INTO Users (user_id, name) VALUES
(101, 'Alice'),
(102, 'Bob');

INSERT INTO Jobs (job_id, title, company_name) VALUES
(2001, 'Frontend Dev', 'ABC Corp'),
(2002, 'Data Analyst', 'XYZ Ltd'),
(2003, 'Backend Dev', 'DEF Inc');

INSERT INTO Job_Applications (id, user_id, job_id, application_date, status) VALUES
(1, 101, 2001, '2024-04-01', 'applied'),
(2, 102, 2002, '2024-04-03', 'rejected'),
(3, 101, 2003, '2024-04-05', 'interview');
```

---

## 📈 Query

```sql
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
```

---

## 🚀 How to Use

1. Clone this repo
2. Use any SQL-compatible tool (MySQL, PostgreSQL, SQLite)
3. Run the schema, insert sample data
4. Execute the query and analyze the output

---

## 📄 License

This project is open source and free to use for educational purposes.

```

Let me know if you'd like to add Docker, Postgres, or Jupyter setup instructions as well!
```

