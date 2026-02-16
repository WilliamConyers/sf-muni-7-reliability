/*
This SQL query is designed to extract and clean data from the 'stops_2025_12'. 
*/

with 
source as (
    select * from {{ source('raw_transit_data', 'stops_2025_12') }}
),

cleaned as (select 
stop_id,
stop_code,
stop_name,
stop_lat,
stop_lon
from source)

select * from cleaned