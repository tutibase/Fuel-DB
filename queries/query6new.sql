select 
	`gas station`.Address as `Адрес`,
	fuel.`Type` as `Тип A`,
    count(*) as `Число доставок на АЗС`
from 
	`gas station`
inner join `fuel tanker-gas station` on `fuel tanker-gas station`.Gas_station_id=`gas station`.Gas_station_id
inner join `fuel tanker-fuel` on `fuel tanker-fuel`.`Fuel_tanker-Fuel_id`=`fuel tanker-gas station`.`Fuel_tanker-Fuel_id`
inner join fuel on fuel.Fuel_id=`fuel tanker-fuel`.Fuel_id
where fuel.`Type`="АИ-95"
group by `gas station`.Gas_station_id
having count(*) > (
	select 
		count(*)
	from 
		`gas station`
	inner join `fuel tanker-gas station` on `fuel tanker-gas station`.Gas_station_id=`gas station`.Gas_station_id
	inner join `fuel tanker-fuel` on `fuel tanker-fuel`.`Fuel_tanker-Fuel_id`=`fuel tanker-gas station`.`Fuel_tanker-Fuel_id`
	inner join fuel on fuel.Fuel_id=`fuel tanker-fuel`.Fuel_id
	where fuel.`Type`="АИ-92" and `gas station`.Gas_station_id=1
)