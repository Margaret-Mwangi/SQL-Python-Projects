/* Top 10 highest revenue generating products */
select
  product_id,
  sum(sale_price) as sales
from
  orders
group by
  product_id
order by
  sales desc
limit
  10


/*Top 5 highest selling products in each region*/
  /*By quantity*/
with
  ranked_sales as (
    select
      region,
      product_id,
      sum(quantity) as total_number_sold,
      dense_rank() over (
        partition by
          region
        order by
          sum(quantity) desc
      ) as sale_rank
    from
      orders
    group by
      region,
      product_id
    order by
      region,
      total_number_sold desc
  )
select
  region,
  product_id,
  total_number_sold
from
  ranked_sales
where
  sale_rank <= 5


/*By total revenue*/
with
  ranked_revenue_sales as (
    select
      region,
      product_id,
      sum(quantity * sale_price) as total_revenue,
      dense_rank() over (
        partition by
          region
        order by
          sum(quantity * sale_price) desc
      ) as revenue_rank
    from
      orders
    group by
      region,
      product_id
    order by
      region,
      total_revenue desc
  )
select
  region,
  product_id,
  total_revenue
from
  ranked_revenue_sales
where
  revenue_rank <= 5


/*Month over month growth comparison for 2022 and 2023 sales eg: jan 2022 vs jan 2023*/
with
  sales as (
    select
      extract(
        year
        from
          order_date
      ) as order_year,
      extract(
        month
        from
          order_date
      ) as order_month,
      cast(sum(quantity * sale_price) as numeric(10, 2)) as total_revenue
    from
      orders
    group by
      1,
      2
    order by
      1,
      2
  )
select
  sales_2022.order_month,
  sales_2022.total_revenue as revenue_2022,
  sales_2023.total_revenue as revenue_2023,
  round(
    (
      (
        sales_2023.total_revenue - sales_2022.total_revenue
      ) / sales_2023.total_revenue
    ) * 100,
    2
  ) as percentange_growth
from
  sales sales_2022
  join sales sales_2023 on sales_2022.order_month = sales_2023.order_month
  and sales_2022.order_year = 2022
  and sales_2023.order_year = 2023


/*For each category, which month had the highest sales by revenue*/
with
  cte as (
    select
      category,
      to_char(order_date, 'YYYYMM') as order_year_month,
      sum(quantity * sale_price) as monthly_revenue
    from
      orders
    group by
      1,
      2
    order by
      1,
      2
  )
select
  *
from
  (
    select
      *,
      rank() over (
        partition by
          category
        order by
          monthly_revenue desc
      ) as sales_rank
    from
      cte
  ) a
where
  sales_rank = 1


/*which sub category had highest growth by profit in 2023 compare to 2022*/
with
  cte as (
    select
      sub_category,
      extract(
        year
        from
          order_date
      ) as sale_year,
      (
        case
          when extract(
            year
            from
              order_date
          ) = 2022 then sum(quantity * profit)
          else 0
        end
      ) as profit_2022,
      (
        case
          when extract(
            year
            from
              order_date
          ) = 2023 then sum(quantity * profit)
          else 0
        end
      ) as profit_2023
    from
      orders
    group by
      1,
      2
    order by
      1,
      2
  )
select
  a.sub_category,
  a.profit_2022,
  b.profit_2023,
  cast(
    (
      ((b.profit_2023 - a.profit_2022) / a.profit_2022) * 100
    ) as numeric(10, 2)
  ) as profit_growth
from
  cte a
  join cte b on a.sub_category = b.sub_category
  and a.sale_year = 2022
  and b.sale_year = 2023