-- creating schema and table.
-- the data can be loaded later to existing tables using python and any sql pakage
create schema transactional_data;

use transactional_data;

-- customer table
create table customers (
	customer_id smallint primary key,
    name varchar(32),
    email varchar(32),
    location varchar(32),
    signup_date date not null,
    birthdate date not null);

-- order tables
create table orders (
	  order_id smallint primary key AUTO_INCREMENT,
      customer_id smallint not null,
	  order_date date not null,
      total_amount decimal(5,2) not null,
      status varchar(16),
      foreign key (customer_id) references customers(customer_id) );

-- products table  
create table products (
	product_id smallint primary key,
    product_name varchar(32) not null,
    category varchar(32) not null,
    price decimal(5,2) not null
	);
 
 -- order items table
create table order_items ( 
	order_id smallint not null,
    product_id smallint not null,
    quantity smallint not null,
    foreign key(order_id) references orders(order_id),
    foreign key(product_id) references products(product_id)) ;

-- customer reviewes    
create table customer_reviews (
		review_id smallint primary key,
        order_id smallint not null,
        product_id smallint not null,
        rating smallint not null,
        review_text varchar(256),
        review_date date,
        foreign key(order_id) references orders(order_id),
        foreign key(product_id) references products(product_id));
        
        
    
    








