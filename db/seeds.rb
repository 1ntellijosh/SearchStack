# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
#likes table
create table favorites (id serial, user_id int, character_id int);
#characters table
create table characters (id int, name varchar(60), deck text, description text, publisher varchar(40), gender int, icon_url varchar(200), real_name varchar(80));
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
