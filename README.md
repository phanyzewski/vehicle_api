# VehicleAPI

  VehicleAPI presents a vehicle with makes, models, & options to be listed,
added, updated, deleted & associated to each other.

## Schema
  All api data is sent and received as JSON.  For the purpose of this example seed data is generated and can be accessed locally when running the server.

## V1 RESTful API
 
  Calling a resource will return a summary representation of that resource, for example
 
  ` GET /v1/vehicles `
  
  will return a representation of vehicles available through the api.
  
  Fetching individual resources will provide a more details representation of that object
  
  `GET /v1/vehicles/1`
  
  Resources made available through this api include vehicles, vehicle_models, vehicle_makes and options.
  Vehicles as well as vehicle_models are closely associated with options
  `GET /v1/vehicle_models/1/options`
  `DELETE /v1/vehicles/1/options/1/`

  Vehicles, their models and their makes are likewise associated with each other.
  
  ## GrapQL API
  
  GraphQL as an alternative api is available as well and presents a specification for accessing data instead of a style.  This api is defined as a schema which describes the entirety of the data.  It provides the objects and their relationships as well as the methods for which the client can interact with them. Additional reading [graphql](http://graphql.org/)
    
  ### example
  ```javascript
  query vehicle(vin: '3GCUKREC3EG233361') {
    mileage
    vehicle_make
    vehicle_model
  }
  ```
  **response**
  ```
  {
  "data": {
    "mileage": 75000,
      "vehicle_make": {
      "name": "Kia"
    },
    "vehicle_model": {
       "name": "Optima",
       "year": "2013"
        }
      }
    }
```
 This example implements [graphiql](https://github.com/graphql/graphiql).  By navigating to localhost:1234/graphiql you can interactively browse the schema, run queries and mutations as defined by the server.
