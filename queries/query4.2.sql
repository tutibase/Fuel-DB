select 
	`technical specialist`.Surname,
    `technical specialist`.`Name`,
    `technical specialist`.Middle_name,
    MinContainerSpecialists.`Число обслуживаемых тар`
from 
	`technical specialist`
inner join (
	SELECT 
		Technical_Specialist_id,
		COUNT(*) AS "Число обслуживаемых тар" 
	FROM `technical specialist-fuel containers`
	GROUP BY Technical_Specialist_id
	HAVING COUNT(Fuel_containers_id) = (
		select min(`Число обслуживаемых тар`)
		from (
		select 
			`technical specialist-fuel containers`.Technical_Specialist_id,
			COUNT(*) AS "Число обслуживаемых тар" 
		from 
			`technical specialist-fuel containers`
		group by `technical specialist-fuel containers`.Technical_Specialist_id
		) as minResult
	) 
) as MinContainerSpecialists on `technical specialist`.Technical_Specialist_id=MinContainerSpecialists.Technical_Specialist_id