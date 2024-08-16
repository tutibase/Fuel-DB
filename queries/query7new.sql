select
	driver.Surname,
    driver.`Name`,
    driver.Middle_name
from
	driver
where driver.driver_id not in (
	select 
		distinct `driver-fuel tanker`.Driver_id
	from 
		`fuel tanker-gas station`
	inner join `fuel tanker-fuel` on `fuel tanker-gas station`.`Fuel_tanker-Fuel_id`=`fuel tanker-fuel`.`Fuel_tanker-Fuel_id`
	inner join fuel on fuel.Fuel_id=`fuel tanker-fuel`.Fuel_id
	inner join `fuel tanker` on `fuel tanker`.Fuel_tanker_id=`fuel tanker-fuel`.Fuel_tanker_id
	inner join `driver-fuel tanker` on `fuel tanker`.Fuel_tanker_id=`driver-fuel tanker`.Fuel_tanker_id
	where fuel.`Type`="Тестовое топливо"
) 