SELECT 
	`marsrutai_miestai`.* 
	, `miestai`.`pav` 
	, COUNT(`marsrutai_miestai`.`id_marsruto`) AS `marsrutu_sk`
	, GROUP_CONCAT(marsrutai.pav) AS `lst_marsrutu` 
FROM 
	`marsrutai_miestai` 
LEFT JOIN 
	`miestai` ON(
		`marsrutai_miestai`.`id_miesto`=`miestai`.`id` 
	)
LEFT JOIN `marsrutai` ON(
	`marsrutai_miestai`.`id_marsruto`=`marsrutai`.`id`
	) 
GROUP BY 
	`marsrutai_miestai`.`id_miesto`