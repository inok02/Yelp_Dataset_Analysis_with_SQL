Data Scientist Role Play: Profiling and Analyzing the Yelp Dataset Coursera Worksheet

This is a 2-part assignment. In the first part, you are asked a series of questions that will help you profile and understand the data just like a data scientist would. For this first part of the assignment, you will be assessed both on the correctness of your findings, as well as the code you used to arrive at your answer. You will be graded on how easy your code is to read, so remember to use proper formatting and comments where necessary.

In the second part of the assignment, you are asked to come up with your own inferences and analysis of the data for a particular research question you want to answer. You will be required to prepare the dataset for the analysis you choose to do. As with the first part, you will be graded, in part, on how easy your code is to read, so use proper formatting and comments to illustrate and communicate your intent as required.

For both parts of this assignment, use this "worksheet." It provides all the questions you are being asked, and your job will be to transfer your answers and SQL coding where indicated into this worksheet so that your peers can review your work. You should be able to use any Text Editor (Windows Notepad, Apple TextEdit, Notepad ++, Sublime Text, etc.) to copy and paste your answers. If you are going to use Word or some other page layout application, just be careful to make sure your answers and code are lined appropriately.
In this case, you may want to save as a PDF to ensure your formatting remains intact for you reviewer.



Part 1: Yelp Dataset Profiling and Understanding

1. Profile the data by finding the total number of records for each of the tables below:
	
i. Attribute table = 10000
	select count(*)
	from attribute;

ii. Business table = 10000
	select count(*)
	from business;

iii. Category table = 10000
	select count(*)
	from category;

iv. Checkin table = 10000
	select count(*)
	from checkin;

v. elite_years table = 10000
	select count(*)
	from elite_years;
 
vi. friend table = 10000
	select count(*)
	from friend;

vii. hours table = 10000
	select count(*)
	from hours;

viii. photo table = 10000
	select count(*)
	from photo;

ix. review table = 10000
	select count(*)
	from review;

x. tip table = 10000
	select count(*)
	from tip;

xi. user table = 10000
	select count(*)
	from user;
	


2. Find the total distinct records by either the foreign key or primary key for each table. If two foreign keys are listed in the table, please specify which foreign key.

i. Business = 10000
	select count(distinct(id))
	from business;

ii. Hours = 1562
	select count(distinct(business_id))
	from hours;

iii. Category = 2643
	select count(distinct(business_id))
	from category;

iv. Attribute = 1115
	select count(distinct(business_id))
	from attribute;

v. Review = 10000
	select count(distinct(id))
	from review;

vi. Checkin = 493
	select count(distinct(business_id))
	from checkin;

vii. Photo = 10000
	select count(distinct(id))
	from photo;

viii. Tip = 537
	select count(distinct(user_id))
	from tip;

ix. User = 10000
	select count(distinct(id))
	from user;

x. Friend = 11
	select count(distinct(user_id))
	from friend;

xi. Elite_years = 2780
	select count(distinct(user_id))
	from elite_years;

Note: Primary Keys are denoted in the ER-Diagram with a yellow key icon.	



3. Are there any columns with null values in the Users table? Indicate "yes," or "no."

	Answer: No
	
	
	SQL code used to arrive at answer:
	
	select *
	from user
	-- I checked through each column indiviudally
	where compliment_photos is null;
	

	
4. For each table and column listed below, display the smallest (minimum), largest (maximum), and average (mean) value for the following fields:

	i. Table: Review, Column: Stars
	
		min: 1		max: 5		avg: 3.7
		
		--SQL Code used to retrieve values
		select max(stars) as max_star,
		(select min(stars) from review) as min_star,
		round((select avg(stars) from review), 1) as avg_star
		from review;
	
	ii. Table: Business, Column: Stars
	
		min: 1.0	max: 5.0	avg: 3.6549

		--SQL code used to retrieve values
		select max(stars) as max_star,
		(select min(stars) from business) as min_star,
		(select avg(stars) from business) as avg_star
		from business;
		
	
	iii. Table: Tip, Column: Likes
	
		min: 0		max: 2		avg: 0.0144
		
		-- SQL code used to retrieve values
		select max(likes) as max_like,
		(select min(likes) from tip) as min_like,
		(select avg(likes) from tip) as avg_like
		from tip;
	
	iv. Table: Checkin, Column: Count
	
		min: 1		max: 53		avg: 1.9414

		-- SQL code used to retrieve values
		select max(count) as max_count,
		(select min(count) from checkin) as min_count,
		(select avg(count) from checkin) as avg_count
		from checkin;
		
	
	v. Table: User, Column: Review_count
	
		min: 0		max: 2000	avg: 24.2995

		-- SQL code used to retrieve values
		select max(review_count) as max_review_count,
		(select min(review_count) from user) as min_review_count,
		(select avg(review_count) from user) as avg_review_count
		from user;
		


5. List the cities with the most reviews in descending order:

	SQL code used to arrive at answer:

	select city, sum(review_count) as total_reviews
	from business
	group by city
	order by total_reviews desc
	
	
	-- Copy and Paste the Result Below:

+-----------------+---------------+
| city            | total_reviews |
+-----------------+---------------+
| Las Vegas       |         82854 |
| Phoenix         |         34503 |
| Toronto         |         24113 |
| Scottsdale      |         20614 |
| Charlotte       |         12523 |
| Henderson       |         10871 |
| Tempe           |         10504 |
| Pittsburgh      |          9798 |
| Montréal        |          9448 |
| Chandler        |          8112 |
| Mesa            |          6875 |
| Gilbert         |          6380 |
| Cleveland       |          5593 |
| Madison         |          5265 |
| Glendale        |          4406 |
| Mississauga     |          3814 |
| Edinburgh       |          2792 |
| Peoria          |          2624 |
| North Las Vegas |          2438 |
| Markham         |          2352 |
| Champaign       |          2029 |
| Stuttgart       |          1849 |
| Surprise        |          1520 |
| Lakewood        |          1465 |
| Goodyear        |          1155 |
+-----------------+---------------+
(Output limit exceeded, 25 of 362 total rows shown)
	

	
6. Find the distribution of star ratings to the business in the following cities:

i. Avon

SQL code used to arrive at answer:

select stars as 'Star Rating', count(stars) as Count
from business
where city = 'Avon'
group by stars


Copy and Paste the Resulting Table Below (2 columns â€“ star rating and count):

+-------------+-------+
| Star Rating | Count |
+-------------+-------+
|         1.5 |     1 |
|         2.5 |     2 |
|         3.5 |     3 |
|         4.0 |     2 |
|         4.5 |     1 |
|         5.0 |     1 |
+-------------+-------+

ii. Beachwood

SQL code used to arrive at answer:

select stars as 'Star Rating', count(stars) as Count
from business
where city = 'Beachwood'
group by stars


Copy and Paste the Resulting Table Below (2 columns â€“ star rating and count):

+-------------+-------+
| Star Rating | Count |
+-------------+-------+
|         2.0 |     1 |
|         2.5 |     1 |
|         3.0 |     2 |
|         3.5 |     2 |
|         4.0 |     1 |
|         4.5 |     2 |
|         5.0 |     5 |
+-------------+-------+

7. Find the top 3 users based on their total number of reviews:
		
	SQL code used to arrive at answer:

	select name, review_count
	from user
	order by review_count desc
	limit 3;
	
		
	Copy and Paste the Result Below:
	
+--------+--------------+
| name   | review_count |
+--------+--------------+
| Gerald |         2000 |
| Sara   |         1629 |
| Yuri   |         1339 |
+--------+--------------+	


8. Does posing more reviews correlate with more fans?

	Please explain your findings and interpretation of the results: 

	According to the data, there is no correlation between review counts and fans. For instance, the highest review count of 2000 has 253 fans whereas the 9th highest review count of 968 has 497 fans. 

	-- SQL code supporting this ascertion

	select name, review_count, fans
	from user
	order by review_count desc, fans desc
	limit 10;

	-- Output

+-----------+--------------+------+
| name      | review_count | fans |
+-----------+--------------+------+
| Gerald    |         2000 |  253 |
| Sara      |         1629 |   50 |
| Yuri      |         1339 |   76 |
| .Hon      |         1246 |  101 |
| William   |         1215 |  126 |
| Harald    |         1153 |  311 |
| eric      |         1116 |   16 |
| Roanna    |         1039 |  104 |
| Mimi      |          968 |  497 |
| Christine |          930 |  173 |
+-----------+--------------+------+ 
	

	
9. Are there more reviews with the word "love" or with the word "hate" in them?

	Answer: There are more reviews with the word "love" than there is with the word "hate"

	Reviews with the word "love" = 1780
	Reviews with the word "hate" = 232

	
	SQL code used to arrive at answer:

	-- Code to extract count of reviews containing the word "hate"
	select count(text) as count_text_containing_hate
	from review
	where text like '%hate%' 

	-- Output

+----------------------------+
| count_text_containing_hate |
+----------------------------+
|                        232 |
+----------------------------+

	-- Code to extract count of reviews containing the word "love"
	select count(text) as count_text_containing_love
	from review
	where text like '%love%' 

	-- Output

+----------------------------+
| count_text_containing_love |
+----------------------------+
|                       1780 |
+----------------------------+

	
	
10. Find the top 10 users with the most fans:

	SQL code used to arrive at answer:

	select name, fans
	from user
	order by fans desc
	limit 10;
	
	
	Copy and Paste the Result Below:

+-----------+------+
| name      | fans |
+-----------+------+
| Amy       |  503 |
| Mimi      |  497 |
| Harald    |  311 |
| Gerald    |  253 |
| Christine |  173 |
| Lisa      |  159 |
| Cat       |  133 |
| William   |  126 |
| Fran      |  124 |
| Lissa     |  120 |
+-----------+------+

	
		

Part 2: Inferences and Analysis

1. Pick one city and category of your choice and group the businesses in that city or category by their overall star rating. Compare the businesses with 2-3 stars to the businesses with 4-5 stars and answer the following questions. Include your code.
	
	(Las Vegas, Restaurants)	

i. Do the two groups you chose to analyze have a different distribution of hours?
	
	Yes, Wingstop hours vary from Jacques Cafe every day of the week.

ii. Do the two groups you chose to analyze have a different number of reviews?
    
    Yes, Wingstop has 123 total reviews and Jacques Cafe has 168 total reviews.     
         
iii. Are you able to infer anything from the location data provided between these two groups? Explain.

	No, given that the two business are in different area codes, there is nothing to infer.

SQL code used for analysis:

SELECT b.name AS 'Name',
    b.review_count AS 'Review Count',
    h.hours AS 'Hours',
    b.postal_code AS 'Postal Code',
    CASE
        WHEN hours LIKE '%sunday%' THEN 1
        WHEN hours LIKE '%monday%' THEN 2
        WHEN hours LIKE '%tuesday%' THEN 3
        WHEN hours LIKE '%wednesday%' THEN 4
        WHEN hours LIKE '%thursday%' THEN 5
        WHEN hours LIKE '%friday%' THEN 6
        WHEN hours LIKE '%saturday%' THEN 7
    END AS Day,
    CASE
        WHEN b.stars BETWEEN 2 AND 3 THEN '2 - 3 Stars'
        WHEN b.stars BETWEEN 4 AND 5 THEN '4 - 5 Stars'
    END AS StarRating
FROM business b
    INNER JOIN hours h ON b.id = h.business_id
    INNER JOIN category c ON c.business_id = b.id
WHERE (b.city = 'Las Vegas')
    AND
    c.category LIKE 'Restaurants'
    AND
    (b.stars BETWEEN 2 AND 3
    OR
    b.stars BETWEEN 4 AND 5)
GROUP BY stars,Day
ORDER BY Day,StarRating ASC
		
		
2. Group business based on the ones that are open and the ones that are closed. What differences can you find between the ones that are still open and the ones that are closed? List at least two differences and the SQL code you used to arrive at your answer.
		
i. Difference 1:

Open businesses have more reviews overall with 269300 compared to closed businesses with 35261.
         
         
ii. Difference 2: 

The average rating for businesses that are open is slightly higher compared to businesses that are closed by a difference of 0.2.
         
         
         
SQL code used for analysis:

select is_open as 'Open (1) or Closed (0)',
    count(is_open) as Count,
    round(avg(stars), 1) as 'Average Star Rating',
    sum(review_count) as 'Total Reviews'
from business
group by is_open

+------------------------+-------+---------------------+---------------+
| Open (1) or Closed (0) | Count | Average Star Rating | Total Reviews |
+------------------------+-------+---------------------+---------------+
|                      0 |  1520 |                 3.5 |         35261 |
|                      1 |  8480 |                 3.7 |        269300 |
+------------------------+-------+---------------------+---------------+
	
	
3. For this last part of your analysis, you are going to choose the type of analysis you want to conduct on the Yelp dataset and are going to prepare the data for analysis.

Ideas for analysis include: Parsing out keywords and business attributes for sentiment analysis, clustering businesses to find commonalities or anomalies between them, predicting the overall star rating for a business, predicting the number of fans a user will have, and so on. These are just a few examples to get you started, so feel free to be creative and come up with your own problem you want to solve. Provide answers, in-line, to all of the following:
	
i. Indicate the type of analysis you chose to do:

For businesses with checkins, does total review count influence the number of checkins that the business gets, regardless of its location?
         
ii. Write 1-2 brief paragraphs on the type of data you will need for your analysis and why you chose that data:

Most times, it's often the case that a business observes more checkins due to the total number of reviews it has reviewed over time. I decided to see if this is true for the Yelp dataset being considered in this scenario. The data required include as follows;

from the business table; 
	i) name
	ii) review_count

from the checkin table;
	i) count

I joined both datasets using an inner join.
                           
                  
iii. Output of your finished dataset:
         
+-------------------------------------------+---------------+---------------+
| business_name                             | total_reviews | checkin_count |
+-------------------------------------------+---------------+---------------+
| Cracker Barrel Old Country Store          |          1782 |           161 |
| LongHorn Steakhouse                       |           882 |            95 |
| John Christ Winery                        |           864 |            64 |
| Courtyard Cleveland Willoughby            |           660 |            95 |
| Spudnut Shop Donuts                       |           420 |            26 |
| Panda Chinese Restaurant                  |           304 |            31 |
| Davitino's Restaurant                     |           304 |            21 |
| Rite Aid                                  |           204 |            46 |
| Pizza Cutter                              |           198 |            28 |
| Stella's Pizza & Italian Restaurant       |           192 |            15 |
| Atlas Cinemas                             |           184 |            29 |
| Red Wagon Farm                            |           143 |            14 |
| Chagrin Valley Little Theatre             |           116 |            54 |
| CVS Pharmacy                              |           114 |            25 |
| Chapman's Food Mart                       |            95 |            24 |
| Days Inn Willoughby/Cleveland             |            84 |             7 |
| Highland Square Tavern                    |            72 |            38 |
| Manakiki Golf Course-Cleveland Metroparks |            65 |            13 |
| Galleria Gowns                            |            64 |             5 |
| Berkshire Hills Golf Course               |            56 |            10 |
| Dairy Queen                               |            33 |            11 |
| Brownie's Market                          |            32 |             9 |
| Wah Sun                                   |            27 |             4 |
| The Inn of Chagrin Falls                  |            18 |             6 |
| Burger King                               |             8 |             3 |
+-------------------------------------------+---------------+---------------+
(Output limit exceeded, 25 of 29 total rows shown)         

iv. Provide the SQL code you used to create your final dataset:

select
    bus.name as business_name,
    sum(bus.review_count) as total_reviews,
    sum(ch.count) as checkin_count
from business bus inner join checkin ch
on bus.id = ch.business_id
group by bus.name
order by total_reviews desc, checkin_count desc
--limit 10