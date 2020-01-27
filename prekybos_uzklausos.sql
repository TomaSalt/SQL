SELECT 
	`prekes_tiekejai`.`id_prekes` , 
	`barkodas` , `nuo_datos` 
FROM 
	`prekes_tiekejai` 
LEFT JOIN 
	`tmp_prekes_tiekejai_su_up1_barkodu` ON(
	`prekes_tiekejai`.`id_prekes` = `tmp_prekes_tiekejai_su_up1_barkodu`.`id_prekes` 
	) 
WHERE 
	`tmp_prekes_tiekejai_su_up1_barkodu`.`id_prekes` IS NOT NULL
	
	
SELECT 
	(YEAR(`prekes_gavimai`.`data`)*100 + MONTH(`prekes_gavimai`.`data`)) AS `menuo`
    , `prekes_tiekejai`.`id_prekes` AS `id_prekes`
    , `prekes`.`id_grupes` AS `id_prekiu_grupes`
    , `prekes_pardavimai`.`id_rinkos` AS `id_rinkos`
    , SUM(`prekes_gavimai`.`kiekis`) AS `kiekis_gauta`
    , SUM(`prekes_gavimai`.`vnt_kaina`*`prekes_gavimai`.`kiekis`) AS `suma_gauta`
    , SUM(`prekes_pardavimai`.`kiekis`) AS `kiekis_parduota`
    , SUM(`prekes_pardavimai`.`vnt_kaina`*`prekes_pardavimai`.`kiekis`) AS `suma_parduota`
FROM 
	`prekes`
LEFT JOIN 
	`prekes_tiekejai` ON( 
        `prekes_tiekejai`.`id_prekes` = `prekes`.`id`
    )    
LEFT JOIN   
	`prekes_gavimai` ON( 
      `prekes_tiekejai`.`barkodas`  = `prekes_gavimai`.`barkodas`
    )
RIGHT JOIN 
	`prekes_pardavimai` ON(
        `prekes_gavimai`.`id` = `prekes_pardavimai`.`id_prekes_gavimo`
    )
GROUP BY (YEAR(`prekes_gavimai`.`data`)*100 + MONTH(`prekes_gavimai`.`data`)), `prekes`.`id`
ORDER BY `id_prekes`,`menuo`

	
SELECT 
	(YEAR(`prekes_gavimai`.`data`)*100 + MONTH(`prekes_gavimai`.`data`)) AS `menuo`
    , `prekes_tiekejai`.`id_prekes` AS `id_prekes`
    , `prekes`.`id_grupes` AS `id_prekiu_grupes`
    , `prekes_pardavimai`.`id_rinkos` AS `id_rinkos`
    , SUM(`prekes_gavimai`.`kiekis`) AS `kiekis_gauta`
    , SUM(`prekes_gavimai`.`vnt_kaina`*`prekes_gavimai`.`kiekis`) AS `suma_gauta`

FROM 
	`prekes`
LEFT JOIN 
	`prekes_tiekejai` ON( 
        `prekes_tiekejai`.`id_prekes` = `prekes`.`id`
    )    
LEFT JOIN   
	`prekes_gavimai` ON( 
      `prekes_tiekejai`.`barkodas`  = `prekes_gavimai`.`barkodas`
    )

GROUP BY (YEAR(`prekes_gavimai`.`data`)*100 + MONTH(`prekes_gavimai`.`data`)), `prekes`.`id`
ORDER BY `id_prekes`,`menuo`

INSERT INTO `balanso_lentele`.`menuo`, `balanso_lentele`.`id_prekes`, `balanso_lentele`.`id_prekiu_grupes`, `balanso_lentele`.`kiekis_gauta`, `balanso_lentele`.`suma_gauta`
SELECT 
	(YEAR(`prekes_gavimai`.`data`)*100 + MONTH(`prekes_gavimai`.`data`)) AS `menuo`
    , `prekes_tiekejai`.`id_prekes` AS `id_prekes`
    , `prekes`.`id_grupes` AS `id_prekiu_grupes`
    , SUM(`prekes_gavimai`.`kiekis`) AS `kiekis_gauta`
    , SUM(`prekes_gavimai`.`vnt_kaina`*`prekes_gavimai`.`kiekis`) AS `suma_gauta`

FROM 
	`prekes`
LEFT JOIN 
	`prekes_tiekejai` ON( 
        `prekes_tiekejai`.`id_prekes` = `prekes`.`id`
    )    
LEFT JOIN   
	`prekes_gavimai` ON( 
      `prekes_tiekejai`.`barkodas`  = `prekes_gavimai`.`barkodas`
    )

GROUP BY (YEAR(`prekes_gavimai`.`data`)*100 + MONTH(`prekes_gavimai`.`data`)), `prekes`.`id`
ORDER BY `id_prekes`,`menuo`