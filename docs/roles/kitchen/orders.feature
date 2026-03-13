Feature: Meal Orders

  Scenario: Ordering a meal
    Given Menu item "Burger" exist on the menu
    Given Menu item "Fries" exist on the menu
    When Customer A orders menu items "Burger" and "Fries"
    Then Receive confirmation for order of customer A for items "Burger" and "Fries"
    When Kitchen has capacity to prepare the order
    Then Kitchen marks the order as "in progress"
    Then Kitchen prepares the "Burger" and "Fries"
    When Preparation of the "Burger" and "Fries" is complete
    Then Kitchen marks the order as "ready for pickup"
    When Customer A picks up the order for items "Burger" and "Fries"
    Then Kitchen marks the order as "complete"