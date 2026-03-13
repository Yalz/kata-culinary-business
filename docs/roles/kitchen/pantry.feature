Feature: Pantry Management

  Scenario: Resupplying pantry items
    Given Pantry item "beef" has 20 units in stock
    Given Pantry item "bun" has 20 units in stock
    Given Pantry item "cheese" has 15 units in stock
    Given Kitchen requires the ingredients of 10 meals to be stocked in the pantry
    Given Menu item "Burger" exist with recipe requiring 2 units of beef, 1 unit of bun, and 1 unit of cheese
    When Kitchen prepares "Burger"
    Then Kitchen alerts that pantry items are running low for "beef"

  Scenario: Efficient pantry usage
    Given Pantry item "onion" has 1 units in stock
    Given Menu item "Diced onions" exist with recipe requiring 0,5 units of onions
    When Kitchen prepares "Diced onions"
    Then Kitchen uses 0,5 units of "onion" from the pantry
    Then Pantry item "onion" has 0,5 units in stock