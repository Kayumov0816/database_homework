SELECT
    c.customer_id,
    c.customer_name,
    ch.channel_name,
    ROUND(SUM(s.sales_amount), 2) AS total_sales
FROM
    customers c
JOIN
    sales s ON c.customer_id = s.customer_id
JOIN
    channels ch ON s.channel_id = ch.channel_id
WHERE
    c.customer_id IN (
        SELECT TOP 300 WITH TIES customer_id
        FROM sales
        WHERE YEAR(purchase_date) IN (1998, 1999, 2001)
        ORDER BY RANK() OVER (PARTITION BY customer_id ORDER BY SUM(sales_amount) DESC)
    )
GROUP BY
    c.customer_id, c.customer_name, ch.channel_name
ORDER BY
    c.customer_id, ch.channel_name;
