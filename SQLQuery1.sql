--select* from sales.customers
--select first_name,last_name,email from sales.customers
--select first_name+' '+last_name  "Fullname" from sales.customers
--select s.email from sales.customers s

/*Sorting of data
-Order by Clause
-Order it in ascending
-Order it in descending


select first_name,last_name,city,zip_code from sales.customers order by first_name desc,last_name desc
*/
--Filtering:Where Clause
--select* from sales.customers where zip_code='12010'
--select* from sales.customers where zip_code !='12010' order by zip_code
--select* from production.stocks where quantity>=20 order by quantity;
--select* from production.stocks where quantity<20 and quantity>0 
--and store_id=1 order by quantity
/*
select state,first_name from sales.customers where state !='CA' or state!='NY'
select distinct state from sales.customers
select state,first_name,city from sales.customers where (state !='CA' and state!='NY') or city='Apple Valley'
*/
--select state,first_name,city from sales.customers where state in('CA','NY')
--select state,first_name,city from sales.customers where state not in('CA','NY')

--select* from sales.customers where phone is null
--select* from sales.customers where phone is not null
--select distinct state,city from sales.customers

--select * from sales.customers where first_name like 'An%'
--select* from sales.customers where first_name like '%in'
--select * from sales.customers where first_name like '%St%'
--select* from sales.customers where first_name like '____ST%'
--select* from sales.customers where first_name like '____st'
--select* from sales.customers where first_name like 'er__st'
/*
select * from production.products 
where model_year not between 2016 and 2018
select * from production.products 
where model_year  between 2016 and 2018
*/
--Aggregation and filtering:group by ang having clause
/*group functions*/
--select count(*) from production.products 
--select count(phone),count(*) from sales.customers
--select count(*) from sales.customers where phone is not null
--select count(model_year) from production.products
--select count(model_year),count(distinct model_year) from production.products
--select max(list_price) from production.products
--select count(* ) "total pdtd",max(list_price) "MaxPrice",min(list_price),avg(list_price) from production.products where model_year=2018
--select model_year,count(*),max(list_price),min(list_price),avg(list_price) from production.products group by model_year
--select model_year,count(model_year) "no of products",max(list_price),avg(list_price) as  "Average price" from production.products group by model_year having count(model_year)>50
--select product_name,model_year,list_price,avg(list_price) over (partition by model_year) as "avgprice",
--list_price-avg(list_price)over (partition by model_year) as "difference" from production.products
--select product_name,model_year,list_price,avg(list_price) over (partition by model_year) as "avgprice",
--list_price-avg(list_price)over (partition by model_year) as "difference" from production.products where model_year=2016

--select product_name,model_year,list_price,avg(list_price) over (partition by model_year) as "avgprice",
--list_price-avg(list_price)over (partition by model_year) as "difference" from production.products having avg(list_price)>750
--select top(5) * from production.products
--select top(20)* from production.products ORDER BY model_year desc
--select TOP 20 PERCENT* FROM PRODUCTION.PRODUCTS

--SELECT SUBTABLE.* FROM (SELECT PRODUCT_NAME,MODEL_YEAR,CATEGORY_ID,LIST_PRICE FROM PRODUCTION.PRODUCTS WHERE MODEL_YEAR=2016) AS "SUBTABLE"
--where SUBTABLE.category_id=3

--select format(8999639478,'###-###-###')

--select list_price, format(list_price,N'C',N'en-In') from production.products

--select format(GETDATE(),'yyyy-mm-dd')

--select format(GETDATE(),'yyyy-MMM-dd')

--select left(category_name,5),len(category_name) from production.categories
--select left(category_name,5),len(category_name),right(category_name,5) from production.categories
--select upper(category_name),left(category_name,5),len(category_name),right(category_name,5) from production.categories
/*update production.categories
set category_name='      '+category_name+'       '
*/
--update production.categories
--set category_name=trim(category_name)
--select trim(category_name) from production.categories
--select category_name,patindex('%BI%',category_name) from production.categories
--select category_name,patindex('%BI_y%',category_name) from production.categories
--select category_name,replace(category_name,'Bikes','MotorBikes')
--from production.categories
--select category_name,replace(category_name,'Bikes','MotorBikes'),REVERSE(category_name) from production.categories
--select str(list_price)from production.products

--select list_price,len(list_price),str(list_price) from production.products

--select substring(product_name,5,10) from production.products
--select current_timestamp,GETDATE()
/*
select YEAR(getdate()),Month(getdate()),day(getdate())
select dateadd(year,2,getdate()) "2 years after current date",
dateadd(year,-2,getdate()) " 2 years before current date"
*/
--select dateadd(month,2,getdate())"2 months after current date",
--dateadd(month,-2,getdate())"2 months before current date"
--dya,week,hour,minute,second,millisecond 
--select *From dbo.emp
--select hiredate,datediff(Year,hiredate,format(getdate(),'yyyy-MM-dd')),datediff(Month,hiredate,format(getdate(),'yyyy-MM-dd'))
--from emp
--select hiredate,datediff(Year,hiredate,format(getdate(),'yyyy-MM-dd')),datediff(Month,hiredate,format(getdate(),'yyyy-MM-dd')),Datename(Month,hiredate),
--Datename(Weekday,hiredate) from emp

--select isdate('2021-12-23'),SYSDATETIME(),getdate()
--select sal,comm,round(sal,0) from emp
--select list_price,round(list_price,0) from production.products
--select list_price,round(list_price,1),ceiling(list_price),floor(list_price) from production.products
--select rand(7)
--select rand()*10+1
--select* from emp
--select  IIF (comm>0.00,'Commision Recieved','No Commision') AS Result from emp
--select sal,comm,IIF (comm>0.00,sal+comm,sal) AS total_salary
--from emp
--select isnull(phone,'phone not available') from sales.customers
--select USER_NAME(),SYSTEM_USER
--select iif(10<20,'TRUE','FALSE')  as res
/*
Select ename
,CASE
when sal>=8000 and sal<=10000 then 'Director' 
when sal>=5000 and sal<8000 then 'Senior Consultant'
Else 'Director'
end as designation
from emp
*/
--select* from production.products order by list_price desc
/* dense rank is a window function that assign rank to each row within a partition of a result set
*/
/*
select product_id,product_name,list_price ,
rank() over (order by list_price desc) price_rank,
dense_rank() over (order by list_price desc) price_dense_rank
from production.products
*/
--select product_id,sum(list_price) from sales.order_items group by product_id

--select product_id,item_id,sum(list_price) sales from sales.order_items group by cube(product_id,item_id)
--select sum(list_price) from sales.order_items

--select product_id,item_id,sum(list_price) sales from sales.order_items group by product_id,rollup(item_id)

/*Joins-extracting a data from two or more tables based on common key
3 types of joinsinner,outer,cross*/
/*
select product_name,list_price,c.category_name from production.products p inner join
production.categories c on p.category_id=c.category_id
where list_price>5000
 order by product_name

 */
 /*
 select product_name,list_price,c.category_name,b.brand_name from production.products p inner join
production.categories c on c.category_id=p.category_id
inner join production.brands b on b.brand_id=p.brand_id
where list_price>5000
 order by product_name
 */
 /*
 select* from production.products
 select* from sales.order_items
 
 --select product_name,order_id from production.products p left join sales.order_items o on o.product_id=p.product_id
 --order by order_id
 --only products which are not sold
 
 select product_name,order_id from production.products p left join sales.order_items o on o.product_id=p.product_id
 where o.order_id is null
 order by order_id
 */
 /*
  select product_name,ord.order_id,item_id,order_date from production.products p left join sales.order_items o on o.product_id=p.product_id
  --left join sales.orders ord on ord.order_id=o.order_id 
  --where ord.order_id=100
 order by order_id
 
 select ename,dname from emp e 
 right join dept d on e.deptno=d.deptno
 
 select e.*,d.* from dept d full join emp e on e.deptno=d.deptno
 
 select e.*,d.* from dept d cross join emp e order by ename
 
 select c1.city,c1.first_name+' '+c1.last_name as customer1,
 c2.first_name+' '+c2.last_name as customer2 
 from sales.customers c1 inner join sales.customers c2
 on c1.customer_id>c2.customer_id and c1.city=c2.city
 order by c1.city
 
 select e.ename 'employee',m.ename 'manager' from emp e inner join emp m on m.empno=e.mgr
 order by m.ename
 */
 --select * from sales.orders where customer_id in(select customer_id from sales.customers where city='New York')
 --select deptno from emp where sal>(select max(losal) from salgrade)
 select dname from dept where deptno in(select deptno from emp where sal>(
 select max(losal) from salgrade))

