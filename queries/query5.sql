select 
	count(*) as "Число бензовозов",
    deliveryCount.`Число доставок`
from (
	select
		`fuel tanker-fuel`.`Fuel_tanker_id`,
		count(*) as "Число доставок"
	from 
		`fuel tanker-fuel`
	inner join `fuel tanker-gas station` on `fuel tanker-gas station`.`Fuel_tanker-Fuel_id`=`fuel tanker-fuel`.`Fuel_tanker-Fuel_id`
	group by `fuel tanker-fuel`.`Fuel_tanker_id`
) as deliveryCount
group by deliveryCount.`Число доставок`
order by deliveryCount.`Число доставок`