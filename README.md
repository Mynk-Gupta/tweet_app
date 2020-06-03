# README
# API Details

## Login
- Url: /users/login
- Method: GET
- Boady Parameters: 
{
    "user":{
      "email": "user_1@test.com",
      "password": "password"
    }
  }
 
 
 ## Add new tweet
- Url: /tweet
- Method: POST
- Header: Authorization Token ( Token get from the login api)
- Boady Parameters: 
{
    "tweet":{
      "content": "First Tweet",
    }
  }
  
 ## Edit a tweet
- Url: /tweet/<tweet_id>
- Method: PUT
- Header: Authorization Token ( Token get from the login api)
- Boady Parameters: 
{
    "tweet":{
      "content": "First Tweet",
    }
  }
  
  ## Delete a tweet
- Url: /tweet/<tweet_id>
- Method: DELETE
- Header: Authorization Token ( Token get from the login api)


## Forgot Password
- Url : /password/forgot
- Method: GET
- URL Parameters: { "email": "<email_of_user>" }
