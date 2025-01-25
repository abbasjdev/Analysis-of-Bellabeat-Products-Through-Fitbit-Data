SELECT
d_a.ID,
ROUND(AVG(d_a.VeryActiveMinutes/60), 2) as avg_very_active_hours, 
ROUND(AVG(d_a.FairlyActiveMinutes/60), 2) as avg_fairly_active_hours,
ROUND(AVG(d_a.LightlyActiveMinutes/60), 2) as avg_lightly_active_hours,
ROUND(24 - AVG((VeryActiveMinutes + FairlyActiveMinutes + LightlyActiveMinutes + TotalMinutesAsleep)/60), 2) as avg_non_awake_rest_hours,
ROUND(AVG(d_s.TotalMinutesAsleep/60), 2) as avg_total_hours_asleep,
ROUND(AVG(d_s.TotalTimeInBed/60), 2) as avg_total_hours_in_bed

FROM biso-project.Bellabeat_data.daily_activity AS d_a

INNER JOIN `biso-project.Bellabeat_data.daily_sleep` AS d_s 
ON d_a.Id = d_s.Id 

GROUP BY d_a.ID
