select 
	`technical specialist`.Surname,
    `technical specialist`.`Name`,
    `technical specialist`.Middle_name,
    MaxContainerSpecialists.`Число обслуживаемых тар`
from 
	`technical specialist`
inner join (
	SELECT 
		Technical_Specialist_id,
		COUNT(*) AS "Число обслуживаемых тар" 
	FROM `technical specialist-fuel containers`
	GROUP BY Technical_Specialist_id
	HAVING COUNT(Fuel_containers_id) = (
		select max(`Число обслуживаемых тар`)
		from (
		select 
			`technical specialist-fuel containers`.Technical_Specialist_id,
			COUNT(*) AS "Число обслуживаемых тар" 
		from 
			`technical specialist-fuel containers`
		group by `technical specialist-fuel containers`.Technical_Specialist_id
		) as maxResult
	) 
) as MaxContainerSpecialists on `technical specialist`.Technical_Specialist_id=MaxContainerSpecialists.Technical_Specialist_id