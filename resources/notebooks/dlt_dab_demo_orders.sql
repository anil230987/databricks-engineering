-- Databricks notebook source
-- create streaming table
create or refresh streaming table st_orders
as
select * from stream(samples.tpch.orders)

-- COMMAND ----------

--create mv
create or replace materialized view agg_orders
as
select count(o_orderkey) as cnt_orders,
o_orderstatus
from live.st_orders
group by o_orderstatus