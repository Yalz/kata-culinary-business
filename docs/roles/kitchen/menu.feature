Feature: Defining menu

  Scenario: Adding menu items
    Given Menu item "Burger" does not exist on the menu
    When Kitchen adds menu item "Burger" recipe requiring 2 units of beef, 1 unit of bun, and 1 unit of cheese
    Then Menu item "Burger" exists on the menu
    Then Menu item "Burger" has recipe requiring 2 units of beef, 1 unit of bun, and 1 unit of cheese

  Scenario: Removing menu items
    Given Menu item "Fries" exist on the menu
    When Kitchen removes menu item "Fries" from the menu
    Then Menu item "Fries" does not exist on the menu

  Scenario: Adding complex menu items
    Given Menu item "BBQ Burger" does not exist on the menu
    Given Menu item "Burger" exist with recipe requiring 2 units of beef, 1 unit of bun, and 1 unit of cheese
    Given Menu item "BBQ Sauce" exist with recipe requiring 10g of brown sugar, 5g of vinegar, and 5g of tomato paste
    When Kitchen adds menu item "BBQ Burger" recipe requiring 1 "Burger" and 1 "BBQ Sauce"
    Then Menu item "BBQ Burger" exists on the menu
    Then Menu item "BBQ Burger" has recipe requiring 1 "Burger" and 1 "BBQ Sauce"
    Then Menu item "BBQ Burger" has recipe requiring 2 units of beef, 1 unit of bun, 1 unit of cheese, 10g of brown sugar, 5g of vinegar, and 5g of tomato paste