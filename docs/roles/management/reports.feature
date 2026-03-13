Feature: Reports

  Scenario: Generating a budget report for a specific period
    Given Table "1" had bill of 20 euros on yesterday
    Given Table "2" had bill of 25 euros on yesterday
    Given Table "3" had bill of 100 euros on yesterday
    Given Table "1" had bill of 50 euros on yesterday
    Given Resupply of pantry items yesterday cost 100 euros
    When Manager requests a budget report for yesterday
    Then The system generates a budget report summarizing total revenue, expenses, and profit
    Then The report includes total revenue of 195 euros
    Then The report includes total expenses of 100 euros
    Then The report includes total profit of 95 euros
    Then The report includes individual revenue entries for yesterday with amounts 20, 25, 100, and 50 euros

  Scenario: Generating a report of the most popular menu items
    Given Table "1" had bill with menu items "Burger", "Burger", "Soda" and "Fries" on yesterday
    Given Table "1" had bill with menu items "Burger", "Soda" and "Fries" on yesterday
    Given Table "2" had bill with menu items "Burger", "Beer" and "Fries" on yesterday
    When Manager requests a report of the most popular menu items for yesterday
    Then The system generates a report listing menu items and their order counts
    Then The report includes "Burger" with 4 orders
    Then The report includes "Fries" with 3 orders
    Then The report includes "Soda" with 2 orders
    Then The report includes "Beer" with 1 order

  Scenario: Generating a report of the used pantry items
    Given Menu item "Burger" on menu with recipe requiring 2 units of beef, 1 unit of bun, and 1 unit of cheese
    Given Menu item "Fries" on menu with recipe requiring 3 units of potatoes
    Given Menu item "Soda" on menu with recipe requiring 300ml of syrup and 300ml of carbonated water
    Given Kitchen made 4 "Burger" yesterday
    Given Kitchen made 3 "Fries" yesterday
    Given Kitchen made 3 "Soda" yesterday
    When Manager requests a report of the used pantry items for yesterday
    Then The system generates a report listing pantry items and their usage counts
    Then The report includes "beef" with 8 units used
    Then The report includes "bun" with 4 units used
    Then The report includes "cheese" with 4 units used
    Then The report includes "potatoes" with 9 units used
    Then The report includes "syrup" with 900ml used
    Then The report includes "carbonated water" with 900ml used