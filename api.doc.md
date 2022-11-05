# API ENDPOINTS DOC
> Using the specifications below, users can access our API endpoints using tools like `postman`, etc.

## Specifications
  ### sign-up

  - Method : `POST`
  - URL : `http://localhost:3000/users`

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
      ```JSON
          {
            "Authorization": "string",
            ... 
          }
      ```
    - Body
      ```JSON
        {
          "user": {
            "id": integer,
            "email": "string",
            "username": "string",
            "role": "string"
          }
        }
      ```
  ### sign-in

  - Method : `POST`
  - URL : `http://localhost:3000/users/sign_in`

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
      ```JSON
          {
            "Authorization": "string",
            ... 
          }
      ```
    - Body
      ```JSON
        {
          "user": {
            "id": integer,
            "email": "string",
            "username": "string",
            "role": "string"
          }
        }
      ```
  ### logged_user

  - Method : `GET`
  - URL : `http://localhost:3000/logged_user`

  - Header
    ```JSON
        {
          "Authorization": "string",
          ... 
        }
    ```
  - Response
    - Header
      ```JSON
          {
            "Authorization": "string",
            ... 
          }
      ```
    - Body
      ```JSON
        {
          "user": {
            "id": integer,
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
    ```JSON
        {
          "Authorization": "string",
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
    - **url**: `http://localhost:3000/api/v1/rooms`
    
    - Body:
      ```JSON
        {
          "room": {
            "name": "string",
            "picture": "string",
            "number_of_beds": integer,
            "price": decimal,
            "description": "string",
            "room_type_id": integer,
            "accomodations": Array<integer>
          }
        }
      ```

  - response
    ```TS
      room: {
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
            name: String,
            type: String,
            number_of_beds: Integer,
            picture : String
            price: String,
            description: String,
            accomodations: Array<String>
          },
          ...
        ]
      ```

  - ### Create reservation
    - **method**: `POST`
    - **url**: `http://localhost:3000/api/v1/reservations`
    
    - Body:
      ```TS
        {
          reservation: {
            from_date: String,
            to_date: String,
            room_id: integer
          }
        }
      ```
    - response
      ```TS
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
          }
        }
        ```
   
   - ### Fetch my reservations:
      - **method**: `GET`
      - **url**: `http://localhost:3000/api/v1/reservations/mine`
      - response
        ```TS
          [
            {
              id: String,
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
            },
            ...
          ]
        ```

   - ### Update reservation:
      - **method**: `PATCH`
      - **url**: `http://localhost:3000/api/v1/reservations/{id}`
        - params: 
          ```JS
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
              id: String,
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

   - ### Cancel reservation:
      - **method**: `DELETE`
      - **url**: `http://localhost:3000/reservations/{id}`
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
