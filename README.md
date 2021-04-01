# Mario's Market

#### A project that tracks store products and associated reviews.

#### By Geof Rosenmund

## Technologies Used

* Ruby
* Rails
* RSPEC
* Pry 
* Devise
* rails_admin
* Capybara
* PostgreSQL
* Faker
* SimpleCov
* HTML/CSS

## Description
This project uses a created database to store and link tables(shown below). A user can create new products and add reviews to those projects. Products and reviews can be edited and deleted. Clicking on a product link in a list will navigate to a page that shows all current reviews. Products can also be edited from this page. Clicking on a review navigates you to a page where you can edit or delete that review. All of the products are listed alphabetically.


## Setup/Installation Requirements

Follow the subsequent instructions to work from Git Hub:

* Clone repository from Github
* Navigate to the top level of the project directory
* To create the Gemfile.lock: $ bundle install
* In order to recreate the databases, enter the following command in your terminal:
  * $ rake db:setup
* To create a local server and run the project: $ rails s
* In your browser, navigate to localhost:3000
* To run any testing: $ rspec   

* To create an admin user run the following:
  * Open the console: $ rails c   
  * Enter the following:
    User.create(   
    username: [insert_username],   
    email: [insert_email],   
    password: [insert_password],   
    admin: true   
  )
* Then log in using those credentials

## Git Hub link:

https://github.com/CrankyJones/mario_market

## Database Layout:

![Database Layout](/product_schema.PNG)

## Known Bugs:

* There are no known bugs at this time.


## **License**
[MIT](https://opensource.org/licenses/MIT)
Copyright (c) [2021] [Geof Rosenmund]

## **Contact Information**
Geof Rosenmund (geof.rosenmunds.email@gmail.com)