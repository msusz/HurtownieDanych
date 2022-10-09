--Proszę przygotować tabelę która zobrazuje popularność każdego rozmiaru pizzy w miesiącu 
--Lutym oraz Marcu 2015

SELECT p.size, sum(od.quantity) count
FROM [1].[dbo].[orders] o
JOIN [1].[dbo].[order_details] od on o.order_id = od.order_id
JOIN [1].[dbo].[pizzas] p on p.pizza_id = od.pizza_id
WHERE (date LIKE '2015-02-%'
	OR date LIKE '2015-03-%')
GROUP BY p.size