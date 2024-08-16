select 
	   `gas station`.Address,
	   fuel.`Type` as "Тип топлива",
	   driver.Name as "Имя водителя",
       driver.Surname as "Фамилия водителя",
       driver.Middle_name as "Отчество водителя",
       COUNT(*) AS "Подсчет" 
 from  
        `gas station` 
                     inner join `fuel tanker-gas station`  
                                on `fuel tanker-gas station`.Gas_station_id=`gas station`.Gas_station_id
                     inner join `fuel tanker-fuel` 
                                on `fuel tanker-gas station`.`Fuel_tanker-Fuel_id`=`fuel tanker-fuel`.`Fuel_tanker-Fuel_id`
                     inner join fuel 
                                on fuel.Fuel_id=`fuel tanker-fuel`.Fuel_id
                      inner join `fuel tanker` 
                                on `fuel tanker-fuel`.Fuel_tanker_id=`fuel tanker`.Fuel_tanker_id
                      inner join `driver-fuel tanker` 
                                on `driver-fuel tanker`.Fuel_tanker_id=`fuel tanker`.Fuel_tanker_id
					  inner join driver 
                                on driver.driver_id=`driver-fuel tanker`.Driver_id
   where fuel.`Type`="АИ-92" and driver.driver_id=7
GROUP BY `gas station`.Address
  HAVING COUNT(*) >= 4
order by `gas station`.Address