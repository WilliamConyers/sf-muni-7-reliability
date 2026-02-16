/*
This SQL query is designed to extract and clean data from the 'stop_observations_2025_12' table for the Muni 7 route. 
It selects relevant columns
*/

with 
source as (
    select * from {{ source('raw_transit_data', 'stop_observations_2025_12') }}
),

cleaned as (select  
route_id,
trip_id,
schedule_relationship,
parse_date('%Y%m%d', cast(service_date as string)) as service_date,
vehicle_id,
stop_sequence,
scheduled_arrival_time,
observed_arrival_time,
uncertainty,
dwell_time_secs,
scheduled_dwell_time_secs,
direction_id,
from_stop_id,
to_stop_id
from source
where route_id = 'SF:7')

select * from cleaned