# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

### Ruby version

### System dependencies

### Configuration

 1. In you [master.key](/config/master.key) replace your key by the key bellow in order to decrypt the project : 
```
    00bcc7567f900fd495bdf2d7983c6271
```
  2. The install all gems by running 
  ```
  bundle install
  ```
### Database creation
  The database is created according to this [ERD Diagram](https://drawsql.app/teams/steve72/diagrams/final-capstone)
  3. Create the database
  ```
  rails db:create
  ```
### Database initialization
  4. Create tables
  ```
  rails db:migrate
  ```
  5. Run the server
  ```
  rails server
  ```

### API Endpoints Examples
  from here you can access the api endpoint using postman on the following addresses:

  - Create a new user and must be  a `POST` request
  ```
      http://localhost:3000/users
  ```
  - For example
    ```JSON
      {
          "user":{
              "username": "First user",
              "email":"user1@gmail.com",
              "password": "123456"
          }
      }
    ```
      - Sign In a user and must be  a `POST`
    ```
        http://localhost:3000/users/sign_in
    ```
  - For example
    ```JSON
      {
          "user":{
              "email":"user1@gmail.com",
              "password": "123456"
          }
      }
    ```
      - Sign In a user and must be a `GET` request
    ```
        http://localhost:3000/logged_user
    ```
    As a result, you should see all informations about the logged user.
  -----
 
  ### **REQUIRED** for all below requests
  - headers:
    ```JSON
      {
        Accept: "application/json",
        "Content-Type": "application/json",
        Authorization: "<AUTH_TOKEN>",
        ...
      }
    ```

  - _**Create reservation:**_
    - **method**: `POST`
    - **url**: `http://localhost:3001/api/v1/reservations`
    
      - body:
        ```JS
          {
            reservation: {
              from_date: String,
              to_date: String,
              room_id: integer
            }
          }
        ```
      - response
        ```JS
          {
            status: 200,
            message: "Reservation created successfully!",
            reservation: {
              id: String,
              status: String,
              from_date: String,
              to_date: String,
              room: {
                name: String,
                type: String,
                number_of_beds: Integer,
                price: String,
                description: String,
                accomodations: Array<String>
              }
            },
          }
        ```

 