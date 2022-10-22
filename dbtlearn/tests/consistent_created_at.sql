SELECT 
    listing_id,
    review_date
FROM {{ ref('fct_reviews') }}
INNER JOIN {{ ref('dim_listings_cleansed') }}
    USING (listing_id)
WHERE review_date < created_at
