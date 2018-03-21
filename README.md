# VehicleAPI

  VehicleAPI presents a vehicle with makes, models, & options to be listed,
added, updated, deleted & associated to each other.

[![Build Status](https://travis-ci.org/phanyzewski/vehicle_api.svg?branch=master)](https://travis-ci.org/phanyzewski/vehicle_api)

### Schema
  All api data is sent and received as JSON.  For the purpose of this example seed data is generated and can be accessed locally when running the server.

### Installation
  This project makes use of [bundler](http://bundler.io/), to install run
  
  ```$ gem install bundler```
    
  After installing bundler, bundle install will download all dependencies
  
  ```$ bundle install```
    
  Other useful commands are as follows
  
  ```$ bundle exec rspec```
    
  ```$ bundle exec rubocop```

## V1 RESTful API

  Calling a resource will return a summary representation, for example

  ` GET /v1/vehicles `

  will return a representation of vehicles available through the api.

  Fetching individual resources will provide a more detailed representation of that object

  `GET /v1/vehicles/1`

  Resources made available through this api are as follows.

* Status

  ```GET /status```

* Vehicles

  ```GET /v1/vehicles ```

  ```POST /v1/vehicles ```

  ```GET /v1/vehicles/:vehicle_id ```

  ```PUT /v1/vehicles/:vehicle_id ```

  ```DELETE /v1/vehicles/:vehicle_id ```

 * Vehicle Options

    ```GET /v1/vehicles/:vehicle_id/options/options ```

    ```POST /v1/vehicles/:vehicle_id/options/options ```

    ```GET /v1/vehicles/:vehicle_id/options/options/:id ```

    ```PUT /v1/vehicles/:vehicle_id/options/options/:id ```

    ```DELETE /v1/vehicles/:vehicle_id/options/options/:id ```

* Vehicle Models

   ```GET /v1/vehicle_models ```

   ```POST /v1/vehicle_models ```

   ```GET /v1/vehicle_models/:vehicle_model_id ```

   ```PUT /v1/vehicle_models/:vehicle_model_id ```

   ```DELETE /v1/vehicle_models/:vehicle_model_id ```

 * Vehicle Model Options

    ```GET /v1/vehicle_models/:vehicle_model_id/options/options```

    ```POST /v1/vehicle_models/:vehicle_model_id/options/options```

    ```GET /v1/vehicle_models/:vehicle_model_id/options/options/:id```

    ```PUT /v1/vehicle_models/:vehicle_model_id/options/options/:id```

    ```DELETE /v1/vehicle_models/:vehicle_model_id/options/options/:id```

* Vehicles associated with Vehicle Models

  ```GET /v1/vehicle_models/:vehicle_make_id/vehicles```

  ```GET /v1/vehicle_models/:vehicle_make_id/vehicles```

* Vehicle Makes

  ```GET /v1/vehicle_makes ```

  ```POST /v1/vehicle_makes ```

  ```GET /v1/vehicles/:vehicle_make_id ```

  ```PUT /v1/veh_makescles/:vehicle_make_id ```

  ```DELETE /v1/vehicle_makes/:vehicle_make_id ```

* Vehicle Models associated with Vehicle Make

  ```GET /v1/vehicle_makes/:vehicle_make_id/vehicle_models```

  ```GET /v1/vehicle_makes/:vehicle_make_id/vehicle_models/:id```


* Vehicles associated with Vehicle Make

  ```GET /v1/vehicle_makes/:vehicle_make_id/vehicles```

  ```GET /v1/vehicle_makes/:vehicle_make_id/vehicles```

* GraphQL

  ```POST /graphql```

## GraphQL API

This example implements and demonstrates the use of [GraphQL](http://graphql.org/) as a query language for VehicleAPI.

After starting a rails server

```$ bundle exec rails s -p 3001 ```

Navigate to ` localhost:3001/graphiql ` to view docs, browse the schema and run queries.  

*Schema documentation is generated automatically by making use of GraphQLs introspection system


### GraphQL Query
```javascript
query manufacturer($name: String!) {
  manufacturer(name: $name) {
  name
    vehicle_models {
      name
      options {
        name
        option_included
      }
      vehicles {
        mileage
        vin
        options {
          name
          option_included
        }
      }
    }
  }
}
```
***response***
```
{
  "data": {
    "manufacturer": {
      "name": "DAIMLERCHRYLSER AG",
      "vehicle_models": [
        {
          "name": "Saaz",
          "options": [
            {
              "name": "[\"roof\"]",
              "option_included": true
            },
            {
              "name": "[\"viral\"]",
              "option_included": true
            }
          ],
          "vehicles": [
            {
              "mileage": 607478,
              "vin": "1C92EKMS7D2GACAMM",
              "options": [
                {
                  "name": "[\"tumblr\"]",
                  "option_included": false
                },
                {
                  "name": "[\"disrupt\"]",
                  "option_included": false
                }
              ]
            },
            {
              "mileage": 195645,
              "vin": "RF38WTX49KNRS0CSL",
              "options": [
                {
                  "name": "[\"austin\"]",
                  "option_included": false
                },
                {
                  "name": "[\"bitters\"]",
                  "option_included": false
                }
              ]
            }
          ]
        }
      ]
    }
  }
}
```

### GraphQL Mutation
```javascript
mutation options($vin: ID!, $option_included: Boolean!, $name: String!){
  update_vehicle_options(vin: $vin, option_included: $option_included, name: $name){
  name
    option_included
    vehicles {
      vin
    }
  }
}
```
***response***
```
{
  "data": {
    "update_vehicle_options": {
      "name": "[\"bitters\"]",
      "option_included": true,
      "vehicles": [
        {
          "vin": "RF38WTX49KNRS0CSL"
        }
      ]
    }
  }
}
```
