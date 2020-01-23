SELECT 
	`pav` AS `marsrutas`
    , COUNT(`id_miesto`) AS `miestu_sk`
FROM 
	`marsrutai`
LEFT JOIN 
	`marsrutai_miestai` ON(
    
		`marsrutai_miestai`.`id_marsruto`=`marsrutai`.`id`
	)
GROUP BY
    `marsrutai_miestai`.`id_marsruto`