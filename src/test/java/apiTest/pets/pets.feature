Feature: sample karate test script
  for help, see: https://github.com/karatelabs/karate/wiki/IDE-Support

  Background:
    * url 'https://petstore.swagger.io/v2'


  Scenario: create a pet and get the created pet by id
    * def newPet =
      """
      {
        "id": 18,
        "category": {
          "id": 1,
          "name": "cat"
        },
        "name": "Izzie",
        "photoUrls": [
          "https://miro.medium.com/v2/resize:fit:950/1*u9llNVCTlbqCaC7BvEc2CA.png"
        ],
        "tags": [
          {
            "id": 1,
            "name": "soft"
          },
          {
            "id": 2,
            "name": "short hair"
          },
          {
            "id": 3,
            "name": "white"
          }
        ],
        "status": "available"
      }
      """

    Given path 'pet'
    * request newPet
    When method POST
    Then status 200

    * def id = response.id
    * print 'created id is: ', id

    Given path 'pet', id
    When method GET
    Then status 200
    And match response contains newPet

  @test
  Scenario: update the pet´s name and status
    * def pet =
      """
      {
        "id": 18,
        "category": {
          "id": 1,
          "name": "cat"
        },
        "name": "Isabel",
        "photoUrls": [
          "https://miro.medium.com/v2/resize:fit:950/1*u9llNVCTlbqCaC7BvEc2CA.png"
        ],
        "tags": [
          {
            "id": 1,
            "name": "soft"
          },
          {
            "id": 2,
            "name": "short hair"
          },
          {
            "id": 3,
            "name": "white"
          }
        ],
        "status": "sold"
      }
      """

    Given path 'pet'
    * request pet
    When method PUT
    Then status 200

    * def id = response.id

    Given path 'pet', id
    When method GET
    Then status 200
    And match response.name == 'Isabel'
    And match response.status == 'sold'

  Scenario: get pets by status sold
    Given path 'pets', 'findByStatus'
    * param status = 'sold'
    When method GET
    Then status 200
    And match each response[*].status == 'sold'