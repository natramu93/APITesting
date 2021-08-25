Feature: Fetch the list of pets

Scenario: Testing the get call for Available pets
Given url 'https://petstore.swagger.io/v2'
And path 'pet/findByStatus'
And param status = 'available'
When method GET
Then status 200
