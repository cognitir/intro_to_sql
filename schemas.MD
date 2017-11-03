# Database Schemas

<!-- TOC -->

- [Database Schemas](#database-schemas)
    - [Housing](#housing)
        - [build_info](#build_info)
        - [categories](#categories)
        - [customers](#customers)
        - [employees](#employees)
        - [employeeterritories](#employeeterritories)
        - [house_details](#house_details)
        - [location_table](#location_table)
        - [main_home](#main_home)
        - [order_details](#order_details)
        - [orders](#orders)
        - [products](#products)
        - [realtor_indo](#realtor_indo)
        - [region](#region)
        - [shippers](#shippers)
        - [size](#size)
        - [suppliers](#suppliers)
        - [territories](#territories)
        - [zip_code_data](#zip_code_data)
    - [Northwind](#northwind)
        - [categories](#categories-1)
        - [customers](#customers-1)
        - [employees](#employees-1)
        - [employeeterritories](#employeeterritories-1)
        - [order_details](#order_details-1)
        - [orders](#orders-1)
        - [products](#products-1)
        - [region](#region-1)
        - [shippers](#shippers-1)
        - [size](#size-1)
        - [suppliers](#suppliers-1)
        - [territories](#territories-1)
    - [pagila_mod](#pagila_mod)
        - [actor](#actor)
        - [address](#address)
        - [category](#category)
        - [city](#city)
        - [country](#country)
        - [customer](#customer)
        - [film](#film)
        - [film_actor](#film_actor)
        - [film_category](#film_category)
        - [inventory](#inventory)
        - [language](#language)
        - [rental](#rental)
        - [staff](#staff)
        - [store](#store)

<!-- /TOC -->

## Housing

### build_info

- yr_built
- yr_renovated
- house_id
- key_column


[Back](#database-schemas) | [Housing](#housing)
### categories

- categoryid
- categoryname
- description
- picture

[Back](#database-schemas) | [Housing](#housing)

### customers

- customerid
- companyname
- contactname
- contacttile
- address
- city
- region
- postalcode
- country
- phone
- fax

[Back](#database-schemas) | [Housing](#housing)

### employees

- employeeid
- lastname
- firstname
- title
- titleofcourtesy
- birthdate
- hiredate
- address
- city
- region
- postalcode
- country
- homephone
- extension
- photo
- notes
- reportsto
- photopath

[Back](#database-schemas) | [Housing](##housing)

### employeeterritories

- employeeid
- territoryid

[Back](#database-schemas) | [Housing](##housing)


### house_details

- detail_id
- bedrooms
- bathrooms
- floors
- waterfront
- view
- condition
- grade
- realtor_id
- house_ids

[Back](#database-schemas) | [Housing](##housing)


### location_table

- zipcode
- latitude
- longitude
- house_id
- location_pk

[Back](#database-schemas) | [Housing](##housing)


### main_home

- id
- price
- year
- month
- day

[Back](#database-schemas) | [Housing](##housing)

### order_details

- orderid
- productid
- unitprice
- quantity
- discount

[Back](#database-schemas) | [Housing](##housing)

### orders

- orderid
- customerid
- employeeid
- orderdate
- requireddate
- shippeddate
- shipvia
- freight
- shipname
- shipaddress
- shipcity
- shipregion
- shippostalcode
- shipcountry

[Back](#database-schemas) | [Housing](##housing)

### products

- productid
- productname
- supplierid
- categoryid
- quantityperunit
- unitprice
- unitsinstock
- unitsonorder
- reorderlevel
- discontinued

[Back](#database-schemas) | [Housing](##housing)

### realtor_indo

- realtor_id
- first
- last
- email
- company

[Back](#database-schemas) | [Housing](##housing)


### region

- regionid
- regiondescription

[Back](#database-schemas) | [Housing](##housing)

### shippers

- shipperid
- companyname
- phone

[Back](#database-schemas) | [Housing](##housing)

### size

- sqft_living
- sqft_lot
- sqft_above
- sqft_basement
- sqft_living15
- sqft_lot15
- house_id
- size_pk

[Back](#database-schemas) | [Housing](##housing)

### suppliers

- supplierid
- companyname
- contactname
- contacttitle
- address
- city
- region
- postalcode
- country
- phone
- fax
- homepage

[Back](#database-schemas) | [Housing](##housing)

### territories
- territoryid
- territorydescription
- regionid

[Back](#database-schemas) | [Housing](##housing)

### zip_code_data

- zip_code
- population
- avg_income
- national_salary_rank

[Back](#database-schemas) | [Housing](##housing)

## Northwind

### categories

- categoryid
- categoryname
- description
- picture

[Back](#database-schemas) | [Northwind](##northwind)

### customers

- customerid
- companyname
- contactname
- contacttitle
- address
- city
- region
- postalcode
- country
- phone
- fax

[Back](#database-schemas) | [Northwind](##northwind)

### employees

- employeeid
- lastname
- firstname
- title
- titleofcourtesy
- birthdate
- hiredate
- address
- city
- region
- postalcode
- country
- homephone
- extension
- photo
- notes
- reportsto
- photopath

[Back](#database-schemas) | [Northwind](##northwind)

### employeeterritories

- employeeid
- territoryid

[Back](#database-schemas) | [Northwind](##northwind)

### order_details

- orderid
- productid
- unitprice
- quantity
- discount

[Back](#database-schemas) | [Northwind](##northwind)

### orders

- orderid
- customerid
- employeeid
- orderdate
- requireddate
- shippeddate
- shipvia
- freight
- shipname
- shipaddress
- shipcity
- shipregion
- shippostalcode
- shipcountry

[Back](#database-schemas) | [Northwind](##northwind)

### products

- productid
- productname
- supplierid
- categoryid
- quantityperunit
- unitprice
- unitsinstock
- unitsonorder
- reorderlevel
- discontinued

[Back](#database-schemas) | [Northwind](##northwind)

### region

- regionid
- regiondescription

[Back](#database-schemas) | [Northwind](##northwind)

### shippers

- shipperid
- companyname
- phone

[Back](#database-schemas) | [Northwind](##northwind)

### size

- sqft_living
- sqft_lot
- sqft_above
- sqft_basement
- sqft_living15
- sqft_lot15
- house_id
- size_pk

[Back](#database-schemas) | [Northwind](##northwind)

### suppliers

- supplierid
- companyname
- contactname
- contacttitle
- address
- city
- region
- postalcode
- country
- phone
- fax
- homepage

[Back](#database-schemas) | [Northwind](##northwind)

### territories

- territoryid
- territorydescription
- regionid

[Back](#database-schemas) | [Northwind](##northwind)

## pagila_mod

### actor

- actor_id
- first_name
- last_name
- last_update

[Back](#database-schemas) | [Pagila-Mod](##pagila-mod)

### address

- address_id
- address
- address2
- district
- city_id
- postal_code
- phone
- last_update

[Back](#database-schemas) | [Pagila-Mod](##pagila-mod)

### category

- category_id
- name
- last_update

[Back](#database-schemas) | [Pagila-Mod](##pagila-mod)

### city

- city_id
- city
- country_id
- last_update

[Back](#database-schemas) | [Pagila-Mod](##pagila-mod)

### country

- country_id
- country
- last_update

[Back](#database-schemas) | [Pagila-Mod](##pagila-mod)

### customer

- customer_id
- store_id
- first_name
- last_name
- email
- address_id
- activebool
- create_date
- last_update
- active

[Back](#database-schemas) | [Pagila-Mod](##pagila-mod)

### film

- film_id
- title
- description
- release_year
- language_id
- original_language_id
- rental_duration
- rental_rate
- length
- last_update
- special_features
- fulltext

[Back](#database-schemas) | [Pagila-Mod](##pagila-mod)

### film_actor

- actor_id
- film_id
- last_update

[Back](#database-schemas) | [Pagila-Mod](##pagila-mod)

### film_category

- film_id
- category_id
- last_update

[Back](#database-schemas) | [Pagila-Mod](##pagila-mod)

### inventory

- inventory_id
- film_id
- store_id
- last_update

[Back](#database-schemas) | [Pagila-Mod](##pagila-mod)

### language

- language_id
- name
- last_update

[Back](#database-schemas) | [Pagila-Mod](#pagila-mod)

### rental

- rental_id
- rental_date
- inventory_id
- customer_id
- return_date
- staff_id
- last_update

[Back](#database-schemas) | [Pagila-Mod](##pagila-mod)

### staff

- staff_id
- first_name
- last_name
- address_id
- email
- store_id
- active
- username
- password
- last_update
- picture

[Back](#database-schemas) | [Pagila-Mod](##pagila-mod)

### store

- store_id
- manager_staff_id
- address_id
- last_update

[Back](#database-schemas) | [Pagila-Mod](##pagila-mod)









