--Pizzeria planuje wdrożenie programu lojalnościowego dla klientów którzy nigdy nie zamówili 
--pizzy z ananasem w Marcu 2015. Proszę o stworzenie tabeli z id takich zamówień. (przydatna 
--funkcja string_agg)

WITH temp AS (
SELECT o.order_id, o.date, string_agg(pt.ingredients, ',') ingredients
	FROM [1].[dbo].[order_details] od
	JOIN [1].[dbo].[pizzas] p on p.pizza_id = od.pizza_id
	JOIN [1].[dbo].[orders] o on o.order_id = od.order_id
	JOIN [1].[dbo].[pizza_types] pt on pt.pizza_type_id = p.pizza_type_id
	WHERE o.date LIKE '2015-03-%'
	AND pt.ingredients NOT LIKE '%Pineapple%'
	GROUP BY o.order_id, o.date
	)
SELECT order_id FROM temp