CREATE SCHEMA public;

create table products(
  id serial primary key,
  name varchar(50) NOT NULL,
  price decimal(10,2) default 0.00 not null,
  description text,
  in_stock boolean,
  specs jsonb,
  created_at timestamptz default now() not null,
  tags character varying(255)[]
);

create table docs(
  id serial primary key,
  body jsonb not null,
  search tsvector
);

insert into products(name, price, description, specs, tags, in_stock)
values ('Product 1', 12.00, 'Product 1 description', null, null, true),
('Product 2', 24.00, 'Product 2 description', '{"weight": 20, "dimensions": {"length": 15, "width": 12}}', '{tag1,tag2}', true),
('Product 3', 35.00, 'Product 3 description', '{"weight": 30, "sizes": [10, 15, 20]}', '{tag2,tag3}', false),
('Product 4', 40.00, 'Product 4 description', '["why", "not", "have", "an", "array"]', '{tag4,tag''quote,"tag,comma","tag{brace}"}', false);


insert into docs(body)
values('{"title":"Document 1","price":22,"description":"lorem ipsum etc","is_good":true,"created_at":"2015-03-04T09:43:41.643Z"}'),
('{"title":"Document 2","price":18,"description":"Macaroni and Cheese","is_good":true,"created_at":"2015-03-04T09:43:41.643Z"}'),
('{"title":"Document 3","price":18,"description":"something or other","is_good":true,"created_at":"2015-03-04T09:43:41.643Z"}'),
('{"title":"Something Else","price":6,"description":"Two buddies fighting crime","is_good":false,"created_at":"1977-03-04T09:43:41.643Z","studios": [{"name" : "Warner"}, {"name" : "Universal"}]}');