CREATE VIEW sales_revenue_by_category_qtr AS
SELECT
    film_category,
    SUM(amount) AS total_sales_revenue
FROM
    sales
WHERE
    DATE_PART('quarter', sale_date) = DATE_PART('quarter', CURRENT_DATE)
GROUP BY
    film_category;

CREATE OR REPLACE FUNCTION get_sales_revenue_by_category_qtr(current_quarter INTEGER)
RETURNS TABLE (
    film_category VARCHAR,
    total_sales_revenue NUMERIC
) AS $$
BEGIN
    RETURN QUERY
    SELECT
        film_category,
        SUM(amount) AS total_sales_revenue
    FROM
        sales
    WHERE
        DATE_PART('quarter', sale_date) = current_quarter
    GROUP BY
        film_category;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION new_movie(movie_title VARCHAR)
RETURNS VOID AS $$
DECLARE
    new_film_id INTEGER;
BEGIN
    -- Generate a new unique film ID (you need to implement your logic for this)
    new_film_id := generate_new_film_id();

    -- Check if the language exists in the "language" table
    IF NOT EXISTS (SELECT 1 FROM language WHERE language_name = 'Klingon') THEN
        RAISE EXCEPTION 'Language Klingon does not exist.';
    END IF;

    -- Insert the new movie into the film table
    INSERT INTO film (film_id, title, rental_rate, rental_duration, replacement_cost, release_year, language)
    VALUES (new_film_id, movie_title, 4.99, 3, 19.99, EXTRACT(YEAR FROM CURRENT_DATE), 'Klingon');
END;
$$ LANGUAGE plpgsql;
