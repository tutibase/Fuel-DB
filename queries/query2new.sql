select
	fuel.`Type` as "Тип топлива",
	`fuel tanker`.Model as "Модель бензовоза",
	COUNT(*) AS "Число поставок" 
from
	`fuel tanker-fuel`
inner join `fuel tanker` on `fuel tanker-fuel`.Fuel_tanker_id=`fuel tanker`.Fuel_tanker_id
inner join `fuel` on fuel.Fuel_id=`fuel tanker-fuel`.`Fuel_tanker-Fuel_id`
inner join `fuel tanker-gas station` on `fuel tanker-fuel`.`Fuel_tanker-Fuel_id`=`fuel tanker-gas station`.`Fuel_tanker-Fuel_id`
where `fuel tanker`.Fuel_tanker_id=1 and fuel.`Type`="АИ-95"