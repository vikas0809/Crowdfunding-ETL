-- Challenge Bonus queries.
-- 1. (2.5 pts)
-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 
-- 
SELECT SUM(backers_count) as "count" ,cf_id
FROM campaign
WHERE outcome='live'
GROUP BY cf_id
ORDER BY "count" DESC;

-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.
-- 
SELECT COUNT(b.backer_id) as "backer_count" ,b.cf_id
FROM backers as b
INNER JOIN campaign  as camp
ON camp.cf_id = b.cf_id
WHERE camp.outcome = 'live'
GROUP BY b.cf_id
ORDER BY "backer_count" DESC;

-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 

SELECT ct.first_name,ct.last_name,ct.email,cmp.goal-cmp.pledged as "Amount_Left"
INTO email_contacts_remaining_goal_amount
FROM contacts as ct
INNER JOIN campaign as cmp
ON ct.contact_id=cmp.contact_id
WHERE cmp.outcome='live'
ORDER BY "Amount_Left" DESC;

-- Check the table

SELECT * FROM email_contacts_remaining_goal_amount;

-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 

SELECT  bkr.cf_id,bkr.first_name,bkr.last_name,bkr.email,
		cmp.company_name,cmp.description,cmp.end_date,
		cmp.goal-cmp.pledged as "Left of Goal"
INTO email_backers_remaining_goal_amount
FROM campaign as cmp
INNER JOIN backers as bkr
ON bkr.cf_id = cmp.cf_id
ORDER BY bkr.email DESC;

-- Check the table

SELECT * FROM email_backers_remaining_goal_amount;
