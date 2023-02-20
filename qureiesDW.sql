# Query 1

select f.s_id, s.s_name, f.total_sales
from fact f, store s, ddate d
where f.s_id = s.s_id and f.d_id = d.d_id and d.Month= '09'
order by f.total_sales DESC limit 3;

# Query 2

 select s.SUPPLIER_ID, SUM(sa.TOTAL_SALE) as Total_sale,d.weekday
 from warehouse.suppliers s, warehouse.sales sa,warehouse.dates d
 where d.weekday='Saturday' OR d.weekday='Sunday' and sa.SUPPLIER_ID = s.SUPPLIER_ID 
 group by SUPPLIER_ID
 order by Total_sale limit 10;

# Query 3

select p_name as Product, quarter as Quarter, month as Month_, sum(total_sales) as Sales
from fact FACT join DDate on (FACT.D_ID = Date) join product PRODUCT on (PRODUCT.p_id = FACT.p_id)
group by FACT.p_id, quarter, month;

# Query 4

select p_name, s_name, sum(total_sales) from fact FACT
join product PRODUCT on (FACT.p_id = PRODUCT.p_id )
join store STORE on (STORE.s_id = FACT.s_id)
group by FACT.FK_p_id, s_id;

# Query 5

select S_ID as Store_ID, 
sum(case when quarter = 1 then total_sales else 0 end) as Quarter1, 
sum(case when quarter = 2 then total_sales else 0 end) as Quarter2, 
sum(case when quarter = 3 then total_sales else 0 end) as Quarter3,
sum(case when quarter = 4 then total_sales else 0 end) as Quarter4
from fact natural join DDate group by P_ID;

# Query 6

select p.PRODUCT_ID,p.PRODUCT_NAME, d.WEEKDAY, sum(sa.TOTAL_SALE) as Sale
from warehouse.products p, warehouse.dates d , warehouse.sales sa
where d.WEEKDAY in ("Sunday", "Saturday" )
and p.PRODUCT_ID = sa.PRODUCT_ID
and d.TIME_ID = sa.TIME_ID 
group by PRODUCT_ID
order by sale desc
limit 5;

# Query 7

SELECT store_ID,supplier_ID,product_ID, sum(s.TOTAL_SALE)
FROM sales s
GROUP BY store_ID,supplier_ID,product_ID WITH ROLLUP;

# Query 8 

select P_ID as Product_ID, 
sum(case when month >= 6 then total_sales else 0 end) as First_Half, 
sum(case when month <= 6 then total_sales else 0 end) as Second_Half,
sum(case when month <= 12 then total_sales else 0 end) as Total_Yearly_Sale
from fact natural join DDate group by P_ID;

# Query 9

SELECT product_name,COUNT(product_name)
FROM warehouse.products
GROUP BY product_name
HAVING COUNT(product_name) > 1;
-- Multiple products exists against a single ID i.e tomatoes 
SELECT *
FROM   metro.products
WHERE  product_name = 'Tomatoes';
-- on further checking it was found that tomatoes have multiple product ids, supplier ids each with different price which causes anamoly

# Query 10

DROP TABLE if exists STORE_PRODUCT_ANALYSIS;
create view STORE_PRODUCT_ANALYSIS AS SELECT s_id, p_id, sum(total_sales) as total_sales from fact inner join store on store.s_id = s_id
inner join product on product.p_id = p_id 
group by s_id, p_id;

