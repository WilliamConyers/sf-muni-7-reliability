/*
This model is designed to extract and clean the trip data for the Muni 7 route from the raw transit data. 
It selects relevant columns such as route_id, trip_id, direction_id, trip_headsign, and block_id, and filters the data to include only records where the route_id is 'SF:7'.
*/

with 
source as (
    select * from {{ source('raw_transit_data', 'trips_2025_12') }}
),

cleaned as (select 
route_id,  
trip_id,
direction_id,
trip_headsign,
block_id
from source
where route_id = 'SF:7')

select * from cleaned