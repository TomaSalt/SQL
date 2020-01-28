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
    , `prekes`.`id` AS `id_prekes`
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

	

INSERT INTO `balanso_lentele`(`menuo`,`id_prekes`,`id_prekiu_grupes`,`kiekis_gauta`,`suma_gauta`)
SELECT 
     `ts_periodai`.`period` AS `menuo`
    , `prekes`.`id` AS `id_prekes`
    , `prekes`.`id_grupes` AS `id_prekiu_grupes`
    , SUM(`prekes_gavimai`.`kiekis`) AS `kiekis_gauta`
    , SUM(`prekes_gavimai`.`vnt_kaina`*`prekes_gavimai`.`kiekis`) AS `suma_gauta`

FROM 
	`ts_periodai`
JOIN									
	`prekes`
LEFT JOIN 
	`prekes_tiekejai` ON( 
        `prekes_tiekejai`.`id_prekes` = `prekes`.`id`
    )    
LEFT JOIN   
	`prekes_gavimai` ON( 
      		    `prekes_tiekejai`.`barkodas`  = `prekes_gavimai`.`barkodas`
		AND
		(YEAR(`prekes_gavimai`.`data`)*100 + MONTH(`prekes_gavimai`.`data`))=`ts_periodai`.`period`
    )
GROUP BY  `ts_periodai`.`period`, `prekes`.`id`
ORDER BY `id_prekes`,`menuo`


INSERT INTO `balanso_lentele`(`menuo`,`id_prekes`,`id_prekiu_grupes`,`kiekis_parduota`,`suma_parduota`)
SELECT 
     `balanso_lentele`.`menuo` AS `menuo`
    , `balanso_lentele`.`id_prekes` AS `id_prekes`
    , `balanso_lentele`.`id_prekiu_grupes` AS `id_prekiu_grupes`
    , SUM(`prekes_pardavimai`.`kiekis`) AS `kiekis_parduota`
    , SUM(`prekes_pardavimai`.`vnt_kaina`*`prekes_pardavimai`.`kiekis`) AS `suma_parduota`
FROM `balanso_lentele`
LEFT JOIN 
	`prekes_tiekejai` ON( 
        `prekes_tiekejai`.`id_prekes` = `balanso_lentele`.`id_prekes`
    )
LEFT JOIN   
	`prekes_gavimai` ON( 
      		    `prekes_tiekejai`.`barkodas`  = `prekes_gavimai`.`barkodas`
		
    )
LEFT JOIN `prekes_pardavimai` ON(
	   `prekes_gavimai`.`id`=`prekes_pardavimai`.`id_prekes_gavimo`
	AND
	  (YEAR(`prekes_pardavimai`.`data`)*100 + MONTH(`prekes_pardavimai`.`data`))=`balanso_lentele`.`menuo`
	)
GROUP BY  `balanso_lentele`.`menuo`, `balanso_lentele`.`id_prekes`
ON DUPLICATE KEY UPDATE 
	`kiekis_parduota`=VALUES(`kiekis_parduota`)
	, `suma_parduota`=VALUES(`suma_parduota`)
