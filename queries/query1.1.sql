select 
	`gas station`.Address,
    fuel.`Type` as "Тип топлива",
    driver.Surname as "Фамилия водителя",
    driver.Name as "Имя водителя",
    driver.Middle_name as "Отчество водителя",
    `technical specialist`.Surname as "Фамилия специалиста",
    `technical specialist`.Name as "Имя специалиста", 
    `technical specialist`.Middle_name as "Отчество специалиста"
from 
	`gas station` 
inner join `fuel tanker-gas station` on `fuel tanker-gas station`.Gas_station_id=`gas station`.Gas_station_id
inner join `fuel tanker-fuel` on `fuel tanker-gas station`.`Fuel_tanker-Fuel_id`=`fuel tanker-fuel`.`Fuel_tanker-Fuel_id`
inner join fuel on fuel.Fuel_id=`fuel tanker-fuel`.Fuel_id
inner join `fuel tanker` on `fuel tanker-fuel`.Fuel_tanker_id=`fuel tanker`.Fuel_tanker_id
inner join `driver-fuel tanker` on `driver-fuel tanker`.Fuel_tanker_id=`fuel tanker`.Fuel_tanker_id
inner join driver on driver.driver_id=`driver-fuel tanker`.Driver_id
inner join `technical specialist-fuel tanker` on `technical specialist-fuel tanker`.Fuel_tanker_id=`fuel tanker`.Fuel_tanker_id
inner join `technical specialist` on `technical specialist-fuel tanker`.`Technical_Specialist_id`=`technical specialist`.`Technical_Specialist_id`
where fuel.`Type`="АИ-92" and driver.driver_id=1 and `technical specialist`.Technical_Specialist_id=3
order by `gas station`.Address