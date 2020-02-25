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
SELECT tbl.au_id, tbl.title_id, SUM(tbl.sales_royalty), tbl.advance
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
GROUP BY tbl.au_id, tbl.title_id;

# Step 3
SELECT sub_table.au_id, SUM(sub_table.sum_sales_royalty) + SUM(sub_table.advance) AS total
FROM(
	SELECT 
	tbl.au_id, 
	tbl.title_id, 
	SUM(tbl.sales_royalty) AS sum_sales_royalty, 
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
	GROUP BY tbl.au_id, tbl.title_id) sub_table
GROUP BY sub_table.au_id
ORDER BY total DESC
LIMIT 3;

