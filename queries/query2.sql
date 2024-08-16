select 
	`fuel in tanker`.Model "Модель бензовоза",
    `fuel in tanker`.`Type` as "Тип топлива",
    COUNT(*) AS "Число поставок" 
from (
	select
		fuel.`Type`,
        `fuel tanker`.Model,
        `fuel tanker-fuel`.`Fuel_tanker-Fuel_id`
	from
		`fuel tanker-fuel`
	inner join `fuel tanker` on `fuel tanker-fuel`.Fuel_tanker_id=`fuel tanker`.Fuel_tanker_id
    inner join `fuel` on fuel.Fuel_id=`fuel tanker-fuel`.`Fuel_tanker-Fuel_id`
    where `fuel tanker`.Fuel_tanker_id=1 and fuel.`Type`="АИ-95"
) as `fuel in tanker`
inner join `fuel tanker-gas station` on `fuel in tanker`.`Fuel_tanker-Fuel_id`=`fuel tanker-gas station`.`Fuel_tanker-Fuel_id`
