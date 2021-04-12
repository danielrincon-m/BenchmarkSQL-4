-- Remove primary keys and indexes.

alter table benchmarksql.warehouse drop constraint pk_warehouse;

alter table benchmarksql.district drop constraint pk_district;

drop index if exists benchmarksql.district.idx_district_d_id;
drop index if exists benchmarksql.district.idx_district_d_w_id;

alter table benchmarksql.customer drop constraint pk_customer;

drop index if exists benchmarksql.customer.idx_customer_c_w_id;
drop index if exists benchmarksql.customer.idx_customer_c_d_id;
drop index if exists benchmarksql.customer.idx_customer_c_id;

-- drop index ndx_customer_name;

alter table benchmarksql.history drop constraint pk_history;

alter table benchmarksql.oorder drop constraint pk_oorder;

-- drop index ndx_oorder_carrier;

alter table benchmarksql.new_order drop constraint pk_new_order;

alter table benchmarksql.order_line drop constraint pk_order_line;

alter table benchmarksql.stock drop constraint pk_stock;

alter table benchmarksql.item drop constraint pk_item;