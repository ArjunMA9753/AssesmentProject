# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...



Here I have implemented the application for the Following Features
Requirements:
• Create a new Rails app
• Create a new model with a name and data of your choosing with some basic validations
• Create a controller for this model that contains endpoints for create and update
o No authentication is required
o Include some basic verification for submitted parameters
• Available third-party API endpoints should be configurable (backend support only, no
need for GUI)
• When new data is stored or updated, all configured endpoints should be notified of the
changes
• Third parties should be provided with means to verify the authenticity of the webhook
request


Based on this only i have implemented, No UI Added for this application, Data is created and updated is done through the API(Curl command also attaching)
Create User
1. curl -X POST -H "Content-Type: application/json" -d '{"name": "Arjun", "email": "arjun@truweight.in", "age": "30", "gender": "Male"}' http://localhost:3000/create_user
Update User
2. curl -X POST -H "Content-Type: application/json" -d '{"id": "2", "name": "Arjun", "email": "vish@truweight.in", "age": "30", "gender": "Male"}' http://localhost:3000/update_user
