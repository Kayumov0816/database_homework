WITH SubcategorySales AS (
    SELECT
        p.prod_subcategory,
        YEAR(s.purchase_date) AS sales_year,
        SUM(s.sales_amount) AS total_sales
    FROM
        products p
    JOIN
        sales s ON p.prod_id = s.prod_id
    WHERE
        YEAR(s.purchase_date) BETWEEN 1998 AND 2001
    GROUP BY
        p.prod_subcategory, YEAR(s.purchase_date)
),
PreviousYearSales AS (
    SELECT
        p.prod_subcategory,
        YEAR(s.purchase_date) AS sales_year,
        SUM(s.sales_amount) AS prev_year_sales
    FROM
        products p
    JOIN
        sales s ON p.prod_id = s.prod_id
    WHERE
        YEAR(s.purchase_date) = YEAR(GETDATE()) - 1
    GROUP BY
        p.prod_subcategory, YEAR(s.purchase_date)
)
SELECT DISTINCT
    s.prod_subcategory
FROM
    SubcategorySales s
JOIN
    PreviousYearSales p ON s.prod_subcategory = p.prod_subcategory
    AND s.sales_year = p.sales_year
WHERE
    s.total_sales > p.prev_year_sales;
