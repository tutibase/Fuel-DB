select 
  driver.Surname,
  driver.`Name`,
  driver.Middle_name,
  fuel.`Type`,
  COALESCE((
    select count(*)
    from `fuel tanker-gas station`
    inner join `fuel tanker-fuel` on `fuel tanker-gas station`.`Fuel_tanker-Fuel_id`=`fuel tanker-fuel`.`Fuel_tanker-Fuel_id`
    inner join fuel as f on fuel.Fuel_id=`fuel tanker-fuel`.Fuel_id
    inner join `fuel tanker` on `fuel tanker`.Fuel_tanker_id=`fuel tanker-fuel`.Fuel_tanker_id
    inner join `driver-fuel tanker` on `fuel tanker`.Fuel_tanker_id=`driver-fuel tanker`.Fuel_tanker_id
    where `driver-fuel tanker`.Driver_id = driver.driver_id and f.`Type` = fuel.`Type`
    group by `driver-fuel tanker`.Driver_id, f.`Type`
  ), 0) as 'Количество доставок'
from 
  driver 
cross join fuel