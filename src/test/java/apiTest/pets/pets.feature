Feature: sample karate test script
  for help, see: https://github.com/karatelabs/karate/wiki/IDE-Support

  Background:
    * url 'https://petstore.swagger.io/v2'
    * configure headers = {Content-Type: 'application/json'}
    * configure retry = { count: 3, interval: 500 }

@create_get
  Scenario Outline: create a pet and get the created pet by <id> - <name>
    * def newPet =
      """
      {
        "id": <id>,
        "category": <category>,
        "name": "<name>",
        "photoUrls": <photoUrls>,
        "tags": <tags>,
        "status": "<status>"
      }
      """

    Given path 'pet'
    * request newPet
    When method POST
    Then status 200

    * def id = response.id
    * print 'created id is: ', id

    Given path 'pet', id
    * retry until responseStatus == 200
    When method GET
    Then status 200
    And match response contains newPet
    Examples:
      | read('data/pets.json') |


  @update
  Scenario Outline: update the pet´s name and status
    * def updatePet =
      """
      {
        "id": <id>,
        "category": <category>,
        "name": "<name>",
        "photoUrls": <photoUrls>,
        "tags": <tags>,
        "status": "<status>"
      }
      """

    Given path 'pet'
    * request updatePet
    * retry until responseStatus == 200
    When method PUT
    Then status 200

    * def id = response.id

    Given path 'pet', id
    When method GET
    Then status 200
    And match response.name == '<name>'
    And match response.status == '<status>'
    Examples:
      | read('data/pets_update.json') |
  @get_sold
  Scenario: get pets by status sold
    Given path 'pet', 'findByStatus'
    * param status = 'sold'
    When method GET
    Then status 200
    And match each response[*].status == 'sold'




