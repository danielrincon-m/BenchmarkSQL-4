-- ALTER DATABASE benchmarksqldb
-- SET MEMORY_OPTIMIZED_ELEVATE_TO_SNAPSHOT = ON;

-- USE benchmarksqldb;
-- SET TRANSACTION ISOLATION LEVEL ;
-- GO

-- ALTER DATABASE benchmarksqldb 
-- ADD FILE (name='benchmarksqldb_mod1', 
-- filename='./benchmarksqldb_mod1') 
-- TO FILEGROUP benchmarksqldb;

USE benchmarksqldb;

-- creates the Schema

CREATE SCHEMA benchmarksql;

-- Creates all tables of the model.

create table benchmarksql.warehouse (
  w_id        integer   not null,
  w_ytd       decimal(12,2),
  w_tax       decimal(4,4),
  w_name      varchar(10),
  w_street_1  varchar(20),
  w_street_2  varchar(20),
  w_city      varchar(20),
  w_state     char(2),
  w_zip       char(9)
)

create table benchmarksql.district (
  d_w_id       integer       not null,
  d_id         integer       not null,
  d_ytd        decimal(12,2),
  d_tax        decimal(4,4),
  d_next_o_id  integer,
  d_name       varchar(10),
  d_street_1   varchar(20),
  d_street_2   varchar(20),
  d_city       varchar(20),
  d_state      char(2),
  d_zip        char(9)
)
--   CONSTRAINT pk_district primary key nonclustered (d_w_id, d_id)
-- )WITH (MEMORY_OPTIMIZED = ON, DURABILITY = SCHEMA_AND_DATA);

create table benchmarksql.customer (
  c_w_id         integer        not null,
  c_d_id         integer        not null,
  c_id           integer        not null,
  c_discount     decimal(4,4),
  c_credit       char(2),
  c_last         varchar(16)    not null,
  c_first        varchar(16)    not null,
  c_credit_lim   decimal(12,2),
  c_balance      decimal(12,2),
  c_ytd_payment  float,
  c_payment_cnt  integer,
  c_delivery_cnt integer,
  c_street_1     varchar(20),
  c_street_2     varchar(20),
  c_city         varchar(20),
  c_state        char(2),
  c_zip          char(9),
  c_phone        char(16),
  c_since        datetime,
  c_middle       char(2),
  c_data         varchar(500)
);

create sequence hist_id_seq AS int;

create table benchmarksql.history (
  hist_id  integer not null default (NEXT VALUE FOR hist_id_seq),
  h_c_id   integer,
  h_c_d_id integer,
  h_c_w_id integer,
  h_d_id   integer,
  h_w_id   integer,
  h_date   datetime,
  h_amount decimal(6,2),
  h_data   varchar(24)
);


create table benchmarksql.oorder (
  o_w_id       integer      not null,
  o_d_id       integer      not null,
  o_id         integer      not null,
  o_c_id       integer      not null,
  o_carrier_id integer,
  o_ol_cnt     decimal(2,0),
  o_all_local  decimal(1,0),
  o_entry_d    datetime
);


create table benchmarksql.new_order (
  no_w_id  integer   not null,
  no_d_id  integer   not null,
  no_o_id  integer   not null
);


create table benchmarksql.order_line (
  ol_w_id         integer   not null,
  ol_d_id         integer   not null,
  ol_o_id         integer   not null,
  ol_number       integer   not null,
  ol_i_id         integer   not null,
  ol_delivery_d   datetime,
  ol_amount       decimal(6,2),
  ol_supply_w_id  integer,
  ol_quantity     decimal(2,0),
  ol_dist_info    char(24)
);


create table benchmarksql.stock (
  s_w_id       integer       not null,
  s_i_id       integer       not null,
  s_quantity   decimal(4,0)  not null,
  s_ytd        decimal(8,2),
  s_order_cnt  integer,
  s_remote_cnt integer,
  s_data       varchar(50),
  s_dist_01    char(24),
  s_dist_02    char(24),
  s_dist_03    char(24),
  s_dist_04    char(24),
  s_dist_05    char(24),
  s_dist_06    char(24),
  s_dist_07    char(24),
  s_dist_08    char(24),
  s_dist_09    char(24),
  s_dist_10    char(24)
);


create table benchmarksql.item (
  i_id     integer      not null,
  i_name   varchar(24),
  i_price  decimal(5,2),
  i_data   varchar(50),
  i_im_id  integer
);

