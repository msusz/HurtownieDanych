--Proszę wykonać tabelę z popularnością danych rodzajów pizzy w miesiącu Styczniu 2015. Ma 
--ona pokazywać ilość sprzedanych rodzajów pizz bez rozróżnienia na jej rozmiary. Tabela ma 
--zawierać nazwę każdej pizzy oraz jej kategorię.

SELECT pt.pizza_type_id, pt.category, sum(od.quantity) popularity
	FROM [1].[dbo].[order_details] od
	JOIN [1].[dbo].[pizzas] p on p.pizza_id = od.pizza_id
	JOIN [1].[dbo].[orders] o on o.order_id = od.order_id
	JOIN [1].[dbo].[pizza_types] pt on pt.pizza_type_id = p.pizza_type_id
	WHERE o.date LIKE '2015-01-%'
	GROUP BY pt.pizza_type_id, pt.category