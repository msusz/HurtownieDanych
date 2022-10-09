--Proszę przygotować tabelę z listą pokazującą liczbę zamówień dla danej pełnej godziny w 
--dniu 1 Stycznia 2015(proszę zaokrąglać do pełnych godzin w dół tj. 11:59 będzie 11)


SELECT COUNT(order_id) order_count, date, datepart(hour, time) hour 
FROM [1].[dbo].[orders]
WHERE date = '2015-01-01'
GROUP BY datepart(hour, time), date