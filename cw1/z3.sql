--Pizzeria planuje nagrodzić klientów o najwyższych zamówieniach bonami kwotowymi. Proszę 
--przygotować tabelę z id 10 największych zamówień dla lutego wraz z ich kwotą przy użyciu 
--funkcji rank () over.

WITH temp AS (
SELECT od.order_id, sum(p.price*od.quantity) price_sum, o.date
	FROM [1].[dbo].[order_details] od
	JOIN [1].[dbo].[pizzas] p on p.pizza_id = od.pizza_id
	JOIN [1].[dbo].[orders] o on o.order_id = od.order_id
	WHERE o.date LIKE '2015-02-%'
	GROUP BY od.order_id, o.date
	)

SELECT TOP(10) order_id,
RANK() OVER (
ORDER BY price_sum DESC) AS ranking
FROM temp