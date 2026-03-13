Feature: Seat Management

  Scenario: Customer requests a table
    Given Table "1" is available (4 person table)
    When Customer "A" arrives and requests a table for 2
    Then Host "A" seats Customer "A" at table "1"

  Scenario: Customer requests a specific table
    Given Table "1" is available (4 person table)
    Given Table "2" is available (4 person table)
    When Customer "A" arrives and requests table "2" for 2
    Then Host "A" seats Customer "A" at table "2"

  Scenario: Customer requests a specific table with insufficient capacity
    Given Table "1" is available (2 person table)
    When Customer "A" arrives and requests table "1" for 4
    Then Customer receives refusal for table "1" due to insufficient capacity

  Scenario: Seating a customer at an occupied table
    Given Table "1" is available (2 person table)
    Given Customer "A" sits at table "1"
    When Customer "B" arrives and requests table "1" for 2
    Then Customer receives refusal for occupied table "1"

  Scenario: Seating a customer at a non-existent table
    When Customer "A" arrives and requests table "404" for 2
    Then Customer receives refusal for non-existent table "999"