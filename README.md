# Airbnb Clone
## Overview
This application is a clone application of Airbnb for learning Ruby on Rails.
```
1. Features
2. Models
3. Technologies
4. Installation
5. ToDo
6. License
```


## 1. Features
This application has basic and simple feature for publishing listings and booking them.
- User Authentication
--> User login authentication.
--> It also supports Facebook login.

- Create Listings(hotel information)
--> Users can publish their own house listings.

- Search listings on map
--> Users can search houses on map.

- Reserve listings
--> Users can reserve houses.

- Payment
--> Users (owner of house and client) can register their own payment information on [Stripe](https://stripe.com/) .


## 2. Models
There are 4 models in this application.
- User
--> Manage user authentication.
--> It has many listings and reservations.

- Listing
--> Manage listing(hotel information)
--> It belongs to users.
--> It has many photos and reservations.

- Photo
--> Manage listings' photos.
--> It belongs to listings.

- Reservation
--> Manage listings' reservations.
--> It belongs to users and listings.


## 3. Technologies
```
[SERVER-SIDE]
- Ruby：v2.4.1
- Ruby on Rails：v5.0.3

[FRONT-END]
- hamlit
- CSS
- JavaScript
- bootstrap

[INFRASTRUCTURE]
- heroku v6.14.4

[main gems]
- devise
- enumerize
- hamlit-rails
- simple_form
- bootstrap-sass
- paperclip
- geocoder
- stripe
- toastr-rails
- omniauth-facebook
- cocoon
```


## 4. Installation
Run commands below on your local environment.
1. git clone https://github.com/yu-croco/airbnb_clone.git
2. cd ~/airbnb_clone
3. bundle install bundle install --without production
4. rails s


## 5. ToDo
- Message feature
--> Currently there is no way to communicate with house owner and client.

- Review feature
--> Currently users can not fill in reviews about their experiences at the houses.

- Listing search feature
--> Currently users can not search listings with price, house types or so on, just with location.


## 6. License
[MIT](http://b4b4r07.mit-license.org)
