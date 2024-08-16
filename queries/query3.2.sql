select
	fuel.`Type`,
    COUNT(distinct `fuel tanker-fuel`.Fuel_tanker_id) AS "Число поставок" 
from 
	fuel
inner join `fuel tanker-fuel` on `fuel tanker-fuel`.Fuel_id=fuel.Fuel_id
inner join `fuel tanker-gas station` on `fuel tanker-gas station`.`Fuel_tanker-Fuel_id`=`fuel tanker-fuel`.`Fuel_tanker-Fuel_id`
group by fuel.`Type`