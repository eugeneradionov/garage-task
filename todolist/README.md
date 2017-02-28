# README

#This is the test task for RubyGarage courses
 
###SQL queries
 
 1. get all statuses, not repeating, alphabetically ordered

    ```sql 
    SELECT DISTINCT status
    FROM tasks
    ORDER BY status
    ```
 2. get the count of all tasks in each project, order by tasks count descending

    ```sql
    SELECT p.name AS 'Project', count(t.id) AS 'Tasks'
    FROM tasks t, projects p
    WHERE t.project_id = p.id
    GROUP BY p.name
    ORDER BY count(t.id) DESC
    ```
 3. get the count of all tasks in each project, order by projects names

    ```sql
    SELECT p.name AS 'Project', count(t.id) AS 'Tasks'
    FROM tasks t, projects p
    WHERE t.project_id = p.id
    GROUP BY p.name
    ORDER BY p.name
    ```
 4. get the tasks for all projects having the name beginning with “N” letter

    ```sql
    SELECT *
    FROM tasks
    WHERE name LIKE 'N%'
    ```
 5. get the list of all projects containing the ‘a’ letter in the middle of the name, and
    show the tasks count near each project. Mention that there can exist projects without tasks and tasks with project_id=NULL

    ```sql
    SELECT p.name AS 'Project', count(t.id) AS 'Tasks'
    FROM tasks t,  projects p
    WHERE t.project_id = p.id 
    AND p.name LIKE '%a%'
    AND t.project_id NOT NULL
    GROUP BY p.name
    ```
 6. get the list of tasks with duplicate names. Order alphabetically

     ```sql
    SELECT *, count(*)
    FROM tasks
    GROUP BY name
    HAVING count(name) > 1
    ORDER BY name
     ```
 7. get the list of tasks having several exact matches of both name and status, from
    the project ‘Garage’. Order by matches count

    ```sql
    SELECT t.*, count(t.id)
    FROM tasks t, projects p
    WHERE t.name = t.status
    AND p.name = 'Garage'
    ORDER BY  count(t.id)
    ```
 8. get the list of project names having more than 10 tasks in status ‘completed’. Order
    by project_id 

    ```sql
    SELECT p.name
    FROM tasks t, projects p
    WHERE p.id = t.project_id
    AND t.status = 'completed'
    GROUP BY p.id
    HAVING count(t.id) > 10
    ORDER BY p.id
    ```