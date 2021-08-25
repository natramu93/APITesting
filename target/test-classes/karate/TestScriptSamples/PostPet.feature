Feature: Post a specific pet


Scenario: Testing the post call for a new pet
Given url 'https://petstore.swagger.io/v2'
And path 'pet'
And request read('post-request.json')
When method POST
Then status 200
And match response == read('resp.json')