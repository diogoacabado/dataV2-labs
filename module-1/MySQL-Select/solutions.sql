SELECT *
FROM titles

# Challenge 1
SELECT authors.au_id, 
authors.au_lname, 
authors.au_fname, 
titles.title, 
publishers.pub_name
FROM authors
INNER JOIN titleauthor
ON authors.au_id = titleauthor.au_id
INNER JOIN titles
ON titles.title_id = titleauthor.title_id
INNER JOIN publishers
ON publishers.pub_id = titles.pub_id
ORDER BY authors.au_id;

#Challenge 2
SELECT authors.au_id, 
authors.au_lname,
authors.au_fname,
publishers.pub_name,
COUNT(titles.title) AS title_count
FROM authors
INNER JOIN titleauthor
ON authors.au_id = titleauthor.au_id
INNER JOIN titles
ON titles.title_id = titleauthor.title_id
INNER JOIN publishers
ON publishers.pub_id = titles.pub_id
GROUP BY authors.au_id, 
authors.au_lname, 
authors.au_fname, 
publishers.pub_name
ORDER BY title_count DESC, au_id DESC

# Challenge 3
SELECT authors.au_id, 
authors.au_lname,
authors.au_fname,
SUM(titles.ytd_sales) AS total
FROM authors
INNER JOIN titleauthor
ON authors.au_id = titleauthor.au_id
INNER JOIN titles
ON titles.title_id = titleauthor.title_id
GROUP BY authors.au_id, 
authors.au_lname, 
authors.au_fname
ORDER BY total DESC
LIMIT 3

# Challenge 4
SELECT authors.au_id, 
authors.au_lname,
authors.au_fname,
IFNULL(SUM(titles.ytd_sales),0) AS total
FROM authors
LEFT JOIN titleauthor
ON authors.au_id = titleauthor.au_id
LEFT JOIN titles
ON titles.title_id = titleauthor.title_id
GROUP BY authors.au_id, 
authors.au_lname, 
authors.au_fname
ORDER BY total DESC


