# API ENDPOINTS DOC
> Using the specifications below, users can access our API endpoints using tools like `postman`, etc.

## Specifications
  ### sign-up

  - Method : `POST`
  - URL : `https://easy-booking12.herokuapp.com/users`

  - Body
      ```JSON
        {
          "user": {
            "email": "string",
            "username": "string",
            "password": "string"
          }
        }
      ```
  - Response
    - Header
      ```TS
          {
            Authorization: String,
            ... 
          }
      ```
    - Body
      ```JSON
        {
          "user": {
            "id": "integer",
            "email": "string",
            "username": "string",
            "role": "string"
          }
        }
      ```
  ### sign-in

  - Method : `POST`
  - URL : `https://easy-booking12.herokuapp.com/users/sign_in`

  - Body
      ```JSON
        {
          "user": {
            "email": "string",
            "password": "string"
          }
        }
      ```
  - Response
    - Header
      ```TS
          {
            Authorization: String,
            ... 
          }
      ```
    - Body
      ```JSON
        {
          "user": {
            "id": "integer",
            "email": "string",
            "username": "string",
            "role": "string"
          }
        }
      ```
  ### logged_user

  - Method : `GET`
  - URL : `https://easy-booking12.herokuapp.com/logged_user`

  - Header
    ```TS
        {
          Authorization: String,
          ... 
        }
    ```
  - Response
    - Header
      ```TS
          {
            Authorization: String,
            ... 
          }
      ```
    - Body
      ```JSON
        {
          "user": {
            "id": "integer",
            "email": "string",
            "username": "string",
            "role": "string"
          }
        }
      ```

  ### logout

  - **Method**: `DELETE`
  - **url**: `http://localhost:3000/users/sign_out`

  - **headers**:
    ```TS
        {
          Authorization: String,
          ... 
        }
    ```
  - **response**:
    - body
      ```JSON
          {
            "message": "User logged out successfully.",
            "status": 200
          }
      ```
 
  ### **REQUIRED** for all below requests
  **headers:**
  ```JSON
    {
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Authorization": "<AUTH_TOKEN>",
      ...
    }
  ```
 - ### Create room
    - **method**: `POST`
    - **url**: `https://easy-booking12.herokuapp.com/api/v1/rooms`
    
    - Body:
      ```TS
        {
          room: {
            name: String,
            picture: String,
            number_of_beds: Integer,
            price: Decimal,
            description: String,
            room_type_id: integer,
            accomodations: Array<Integer>
          }
        }
      ```

  - response
    ```TS
      room: {
        id: Integer,
        name: String,
        type: String,
        number_of_beds: Integer,
        picture : String
        price: String,
        description: String,
        accomodations: Array<String>
      }
    ```

 - ### Fetch rooms :
    - **method**: `GET`
    - **url**: `http://localhost:3000/api/v1/rooms`
    
    - response
      ```TS
        [ 
          {
            id: Integer,
            name: String,
            type: String,
            number_of_beds: Integer,
            picture : String
            price: Float,
            description: String,
            accomodations: Array<String>
          },
          ...
        ]
      ```

  - ### Create reservation
    - **method**: `POST`
    - **url**: `https://easy-booking12.herokuapp.com/api/v1/reservations`
    
    - Body:
      ```TS
        {
          reservation: {
            from_date: String,
            to_date: String,
            room_id: Integer
          }
        }
      ```
    - response
      ```TS
        {
          status: 200,
          message: "Reservation created successfully!",
          reservation: {
            id: Integer,
            status: String,
            from_date: String,
            to_date: String,
            room: {
              id: Integer,
              name: String,
              type: String,
              number_of_beds: Integer,
              price: String,
              description: String,
              accomodations: Array<String>
            }
          }
        }
        ```
   
   - ### Fetch my reservations:
      - **method**: `GET`
      - **url**: `https://easy-booking12.herokuapp.com/api/v1/reservations/mine`
      - response
        ```TS
          [
            {
              id: Integer,
              status: String,
              from_date: String,
              to_date: String,
              room: {
                id: Integer,
                name: String,
                type: String,
                number_of_beds: Integer,
                price: Float,
                description: String,
                accomodations: Array<String>
              }
            },
            ...
          ]
        ```

   - ### Update reservation:
      - **method**: `PATCH`
      - **url**: `https://easy-booking12.herokuapp.com/api/v1/reservations/{id}`
        - params: 
          ```TS
            id: String
          ```
      - body:
        ```TS
          {
            reservation: {
              from_date: String,
              to_date: String
            }
          }
        ```
      - response
        ```TS
          {
            status: 200,
            message: "Reservation updated successfully!",
            reservation: {
              id: Integer,
              status: String,
              from_date: String,
              to_date: String,
              room: {
                id: Integer,
                name: String,
                type: String,
                number_of_beds: Integer,
                price: Float,
                description: String,
                accomodations: Array<String>
              }
            }
          }
        ```

   - ### Cancel reservation:
      - **method**: `DELETE`
      - **url**: `https://easy-booking12.herokuapp.com/reservations/{id}`
        - params: 
          ```TS
            id: String
          ```
      - response
        ```TS
          {
            status: 200,
            message: "Reservation canceled successfully!"
          }
        ``` 
