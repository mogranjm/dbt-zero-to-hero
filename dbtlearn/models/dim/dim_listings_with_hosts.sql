WITH h AS (
    SELECT * FROM {{ ref("dim_hosts_cleansed") }}
),
l AS (
    SELECT * FROM {{ ref("dim_listings_cleansed") }}
)

SELECT 
    l.listing_id,
    l.listing_name,
    l.minimum_nights,
    l.price,
    l.host_id,
    h.host_name,
    h.is_superhost AS host_is_superhost,
    l.created_at,
    GREATEST(l.updated_at, h.updated_at) as updated_at
FROM h
LEFT JOIN l
ON h.host_id = l.host_id