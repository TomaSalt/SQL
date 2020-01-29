INSERT INTO 
	`tikrinimo_lentele`(
		`id_prekes`
		,`id_tiekejo`
		,`id_prekiu_grupes`
		,`barkodas`
		,`nuo_datos`
	)
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


SELECT 
    	`prekes_tiekejai`.`id_prekes` AS `id_prekes`
	, `prekes_tiekejai`.`barkodas` AS `barkodas`
    	, `prekes_gavimai`.`id` AS `id_prekes_gavimo`
    	, SUM(`prekes_pardavimai`.`kiekis`) AS `kiekis_viso`
	, SUM(`prekes_pardavimai`.`vnt_kaina`*`prekes_pardavimai`.`kiekis`) AS `viso_suma`
FROM 
	`prekes_tiekejai`
LEFT JOIN 
	`prekes_gavimai` ON( 
       	
		`prekes_tiekejai`.`barkodas`= `prekes_gavimai`.`barkodas`
    	)
LEFT JOIN 
	`prekes_pardavimai` ON(
		`prekes_gavimai`.`id` = `prekes_pardavimai`.`id_prekes_gavimo`
	)
WHERE
	 1
GROUP BY 
	`id_prekes`


SELECT 
	`id_prekes`
	, SUM(`kiekis_parduota`) AS `kiekis_viso`
	, SUM(`suma_parduota`) AS `suma_viso`
FROM 
	`balanso_lentele` 
WHERE 
	1 
GROUP BY 
	`id_prekes`