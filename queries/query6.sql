WITH `ПорогТабл` AS (
    select 
		firstStation.Address as `АЗС 1`,
        firstStation.`Type` as `Тип 1`,
		count(*) as `Порог`
	from (
		select 
			`gas station`.Address,
			fuel.`Type`
		from 
			`gas station`
		inner join `fuel tanker-gas station` on `fuel tanker-gas station`.Gas_station_id=`gas station`.Gas_station_id
		inner join `fuel tanker-fuel` on `fuel tanker-fuel`.`Fuel_tanker-Fuel_id`=`fuel tanker-gas station`.`Fuel_tanker-Fuel_id`
		inner join fuel on fuel.Fuel_id=`fuel tanker-fuel`.Fuel_id
		where fuel.`Type`="АИ-92" and `gas station`.Gas_station_id=1
	) as firstStation
)

select 
	`gas station`.Address as `АЗС 2`,
	fuel.`Type` as `Тип 2`,
    count(*) as `Число доставок на 2 АЗС`,
    (select `Порог` from `ПорогТабл`) as `Порог`,
    (select `АЗС 1` from `ПорогТабл`) as `АЗС 1`,
    (select `Тип 1` from `ПорогТабл`) as `Тип 1`
from 
	`gas station`
inner join `fuel tanker-gas station` on `fuel tanker-gas station`.Gas_station_id=`gas station`.Gas_station_id
inner join `fuel tanker-fuel` on `fuel tanker-fuel`.`Fuel_tanker-Fuel_id`=`fuel tanker-gas station`.`Fuel_tanker-Fuel_id`
inner join fuel on fuel.Fuel_id=`fuel tanker-fuel`.Fuel_id
where fuel.`Type`="АИ-95"
group by `gas station`.Gas_station_id
having count(*) > (select `Порог` from `ПорогТабл`)