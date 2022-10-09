/* Na podstawie dostarczonych danych proszę wyznaczyć średnią kwotę zamówienia w dniu 18 Lutego 2015. */
WITH temp AS (
SELECT od.order_id, sum(p.price*od.quantity) price_sum, o.date
	FROM [1].[dbo].[order_details] od
	JOIN [1].[dbo].[pizzas] p on p.pizza_id = od.pizza_id
	JOIN [1].[dbo].[orders] o on o.order_id = od.order_id
	WHERE o.date = '2015-02-18'
	GROUP BY od.order_id, o.date
	)

SELECT cast(round(avg(price_sum), 2) as decimal(36,2)) average_total FROM temp