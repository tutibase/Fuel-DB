select 
	driver.Surname,
    driver.`Name`,
    driver.Middle_name,
    deliveriesNum.`Type`,
	COALESCE (deliveriesNum.`Количество доставок`, 0) as 'Количество доставок'
from 
	driver 
cross join fuel
left join (
	select 
		`driver-fuel tanker`.Driver_id,
		fuel.`Type`,
		count(*) as `Количество доставок`
	from 
		`fuel tanker-gas station`
	inner join `fuel tanker-fuel` on `fuel tanker-gas station`.`Fuel_tanker-Fuel_id`=`fuel tanker-fuel`.`Fuel_tanker-Fuel_id`
	inner join fuel on fuel.Fuel_id=`fuel tanker-fuel`.Fuel_id
	inner join `fuel tanker` on `fuel tanker`.Fuel_tanker_id=`fuel tanker-fuel`.Fuel_tanker_id
	inner join `driver-fuel tanker` on `fuel tanker`.Fuel_tanker_id=`driver-fuel tanker`.Fuel_tanker_id
	group by Driver_id, `Type`
) as deliveriesNum on deliveriesNum.Driver_id=driver.driver_id and deliveriesNum.`Type`=fuel.`Type`