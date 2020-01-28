INSERT INTO `ts_periodai` (`period`)
SELECT 
	YEAR(`prekes_gavimai`.`data`)*100+MONTH(`prekes_gavimai`.`data`) AS `period`
FROM `prekes_gavimai`
GROUP BY
YEAR(`prekes_gavimai`.`data`)*100+MONTH(`prekes_gavimai`.`data`) ASC

INSERT INTO `ts_periodai` (`period`, `flag_gav_pard`)
SELECT 
	YEAR(`prekes_pardavimai`.`data`)*100+MONTH(`prekes_pardavimai`.`data`) AS `period`
	, 1 AS `flag_gav_pard`
FROM `prekes_pardavimai`
GROUP BY
YEAR(`prekes_pardavimai`.`data`)*100+MONTH(`prekes_pardavimai`.`data`) ASC
ON DUPLICATE KEY UPDATE
	`flag_gav_pard`=VALUES(`flag_gav_pard`)+1