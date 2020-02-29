# Challenge 1

# Step 1
SELECT 
titleauthor.au_id, 
titleauthor.title_id,
titles.advance * titleauthor.royaltyper / 100 AS advance, 
titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 AS sales_royalty
FROM titleauthor
INNER JOIN titles
ON titleauthor.title_id = titles.title_id
INNER JOIN sales
ON titles.title_id = sales.title_id;

# Step 2
SELECT 
tbl.au_id, 
tbl.title_id, 
tbl.advance, 
SUM(tbl.sales_royalty) AS sales_total
FROM (
	SELECT 
	titleauthor.au_id, 
	titleauthor.title_id,
	titles.advance * titleauthor.royaltyper / 100 AS advance, 
	titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 AS sales_royalty
	FROM titleauthor
	INNER JOIN titles
	ON titleauthor.title_id = titles.title_id
	INNER JOIN sales
	ON titles.title_id = sales.title_id) tbl
GROUP BY tbl.au_id, tbl.title_id, advance;

# Step 3
SELECT sub_table.au_id, SUM(sub_table.sales_total) + SUM(sub_table.advance) AS total
FROM(
	SELECT 
	tbl.au_id, 
	tbl.title_id, 
	SUM(tbl.sales_royalty) AS sales_total, 
	tbl.advance AS advance
	FROM(
		SELECT
		titleauthor.au_id, 
		titleauthor.title_id,
		titles.advance * titleauthor.royaltyper / 100 AS advance, 
		titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 AS sales_royalty
		FROM titleauthor
		INNER JOIN titles
		ON titleauthor.title_id = titles.title_id
		INNER JOIN sales
		ON titles.title_id = sales.title_id) tbl
	GROUP BY tbl.au_id, tbl.title_id, advance) sub_table
GROUP BY sub_table.au_id
ORDER BY total DESC
LIMIT 3;


# Challenge 2

# Step 1

CREATE TEMPORARY TABLE temp_1
SELECT
titleauthor.au_id, 
titleauthor.title_id,
titles.advance * titleauthor.royaltyper / 100 AS advance, 
titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 AS sales_royalty
FROM titleauthor
INNER JOIN titles
ON titleauthor.title_id = titles.title_id
INNER JOIN sales
ON titles.title_id = sales.title_id;

SELECT *
FROM temp_1;

# Step 2

CREATE TEMPORARY TABLE temp_2
SELECT 
au_id, 
title_id,
advance,
SUM(sales_royalty) AS sales_total
FROM temp_1
GROUP BY au_id, title_id, advance;

SELECT *
FROM temp_2;

# Step 3
SELECT 
au_id, 
SUM(sales_total) + SUM(advance) AS total
FROM temp_2
GROUP BY au_id
ORDER BY total DESC
LIMIT 3;

# Challenge 3

CREATE TABLE most_profiting_authors
SELECT 
au_id, 
SUM(sales_total) + SUM(advance) AS profits
FROM temp_2
GROUP BY au_id
ORDER BY profits DESC
LIMIT 3;

SELECT *
FROM most_profiting_authors;

