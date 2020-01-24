SELECT 
	CONCAT_WS(' ',vardas,pavarde) AS `asmuo`
	, COUNT(`id`) AS `kartai` 
FROM 
	`asmenys` 
WHERE 
	1 
GROUP BY 
	CONCAT_WS(' ',vardas,pavarde) 
HAVING 
	`kartai`>1