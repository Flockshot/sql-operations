# Database Implementation and Querying (SQL & Relational Algebra)

Implemented a fully functional relational database in Oracle DBMS and developed complex queries using both formal relational algebra and practical SQL, demonstrating the ability to bridge theoretical understanding with real-world database execution.

![SQL](https://img.shields.io/badge/Language-SQL-CB4335.svg?logo=sql&logoColor=white)
![Oracle](https://img.shields.io/badge/Database-Oracle_21c-F80000.svg?logo=oracle&logoColor=white)
![Theory](https://img.shields.io/badge/Theory-Relational_Algebra-4A90E2.svg)

---

## 🎯 Project Overview

This project demonstrates the full-cycle implementation of a database, from conceptual design to practical, high-performance querying. The work is split into two key areas:

1.  **Database Implementation:** Creating a database schema from scratch using SQL DDL, enforcing constraints, and populating it with data (DML). This was done for the "NCCCloud" cloud gaming service.
2.  **Advanced Querying:** Writing complex data retrieval operations against the database using two different methods:
    * **Formal Relational Algebra:** The theoretical, mathematical foundation of database queries (e.g., for the "FindJob" schema).
    * **Practical SQL:** The declarative language used to execute these queries on a live Oracle database.

---

## 1. Schema Implementation (DDL & DML)

The "NCCCloud" database was built from the ground up using SQL Data Definition Language (DDL) and Data Manipulation Language (DML).

* **`NCCCloudData.sql`:** This script contains:
    * **`CREATE TABLE` (DDL):** Defines all tables for the schema (e.g., `Users`, `Computers`, `Subscription`, `PlaySession`).
    * **Constraints:** Implements entity and referential integrity using `PRIMARY KEY`, `FOREIGN KEY`, `NOT NULL`, and `CHECK` constraints.
    * **`INSERT INTO` (DML):** Populates the created tables with a complete, consistent dataset, ready for querying.

> **[Image: EER Diagram for the NCCCloud or FindJob schema]**
>
> 

---

## 2. Theoretical vs. Practical Querying

The core of this project was translating formal relational logic into executable SQL code.

### Relational Algebra (The "Theory")

Formal relational algebra expressions were developed to solve complex data problems. This demonstrates a theoretical understanding of *how* queries are constructed.



**Example Query:** "List the name, surname, and email of Members who created 'Standard' groups after Jan 1, 2022."

**Formal Algebra:**
`Π_name, surname, email (σ_type='Standard' AND create_date>'01/01/2022' (Member ⋈_member_id=created_by Group))`

### SQL (The "Practice")

The relational algebra expressions were then translated into optimized, practical SQL. This part of the project involved writing complex queries using:

* Multi-table `JOIN` operations
* `WHERE` clauses with complex predicates
* Aggregate functions (`COUNT`, `SUM`, `AVG`) with `GROUP BY` and `HAVING`
* Nested subqueries and correlated subqueries

**SQL Translation of the above:**
```sql
SELECT T1.name, T1.surname, T1.email
FROM Member T1
JOIN "Group" T2 ON T1.member_id = T2.created_by
WHERE T2.type = 'Standard' AND T2.create_date > '01/01/2022';
```
> **[Image: Screenshot of a complex SQL query in Oracle SQL Developer]**
>
> 

[Image of SQL Inner Join visualization]


---

## 🛠️ Technology Stack

* **Database:** Oracle Database 21c Express Edition
* **IDE:** Oracle SQL Developer
* **Languages:** SQL (DDL, DML, Select), Relational Algebra

## 🚀 How to Run

1.  **Install Oracle:** Download and install Oracle 21c Express Edition.
2.  **Connect:** Open Oracle SQL Developer and connect to your local Oracle instance.
3.  **Create Schema:** Open and run the `NCCCloudData.sql` script. This will create all tables and insert all data. After it finishes, you can verify by running `SELECT * FROM Users;` or `SELECT * FROM Computers;`.
4.  **Run Queries:** Open the `NCCCloudQueries.sql` script. You can run each query one by one to see the results.