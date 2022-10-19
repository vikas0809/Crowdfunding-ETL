campaign
-
cf_id int PK
contact_id int FK - contacts.contact_id
company_name VARCHAR(100)
description text
goal numeric(10,2)
pledged numeric(10,2)
outcome VARCHAR(50)
backers_count INT
country VARCHAR(20)
currency VARCHAR(10)
launched_date DATE
end_date DATE
category_id VARCHAR(10) FK >- category.category_id
subcategory_id VARCHAR(10) FK >- subcategory.subcategory_id

category
-
category_id VARCHAR(10) PK
category_name VARCHAR(50)

subcategory
-
subcategory_id VARCHAR(10) PK
subcategory_name VARCHAR(50)

contacts
-
contact_id INT PK
first_name VARCHAR(50)
last_name VARCHAR(50)
email VARCHAR(100)

backers
-
backer_id PK varchar(5)
cf_id FK >- campaign.cf_id
first_name varchar(50)
last_name varchar(50)
email varchar(100)