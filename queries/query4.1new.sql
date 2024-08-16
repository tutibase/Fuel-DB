select
	`technical specialist`.Surname,
    `technical specialist`.`Name`,
    `technical specialist`.Middle_name,
    count(*) as `Число обслуживаемых тар`
from
	`technical specialist`
inner join `technical specialist-fuel containers` 
		on `technical specialist`.Technical_Specialist_id=`technical specialist-fuel containers`.Technical_Specialist_id
group by `technical specialist`.Technical_Specialist_id
having `Число обслуживаемых тар` = (
	select
		count(*)
	from 
		`technical specialist-fuel containers` 
	group by `technical specialist-fuel containers`.Technical_Specialist_id
    order by count(*) desc
    limit 1
)