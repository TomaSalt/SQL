INSERT INTO `tikrinimo_lentele`(`id_prekes`,`id_tiekejo`,`id_prekiu_grupes`,`barkodas`,`nuo_datos`)
SELECT 
    	`prekes`.`id` AS `id_prekes`
	, `prekes_tiekejai`.`id_tiekejo` AS `id_tiekejo`
    	, `prekes`.`id_grupes` AS `id_prekiu_grupes`
    	, `prekes_tiekejai`.`barkodas` AS `barkodas`
	, `prekes_tiekejai`.`nuo_datos` AS `nuo_datos`
FROM 
	`prekes`
LEFT JOIN 
	`prekes_tiekejai` ON( 
        `prekes_tiekejai`.`id_prekes` = `prekes`.`id`
    ) 