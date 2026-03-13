Feature: Meal Orders

  Scenario: Ordering a meal
    Given Menu item "Burger" exist on the menu
    Given Menu item "Fries" exist on the menu
    When Customer "A" orders menu items "Burger" and "Fries"
    Then Customer "A" receives confirmation for order with items "Burger" and "Fries"
    When Kitchen has capacity to prepare the order
    Then Kitchen marks the order as "in progress"
    Then Kitchen prepares the "Burger" and "Fries"
    When Preparation of the "Burger" and "Fries" is complete
    Then Kitchen marks the order as "ready for pickup"
    When Customer "A" picks up the order for items "Burger" and "Fries"
    Then Kitchen marks the order as "complete"

  Scenario: Ordering a meal with unavailable item
     Given Menu item "Burger" exist on the menu
     Given Menu item "Fries" exist on the menu
     When Customer "A" orders menu items "Burger", "Fries", and "Soda"
     Then Customer "A" receives refusal for order with invalid item "Soda"

  Scenario: Ordering a meal, but preparation failed
    Given Menu item "Burger" exist on the menu
    Given Menu item "Fries" exist on the menu
    When Customer "A" orders menu items "Burger" and "Fries"
    Then Customer "A" receives confirmation for order with items "Burger" and "Fries"
    When Kitchen has capacity to prepare the order
    Then Kitchen marks the order as "in progress"
    Then Kitchen prepares the "Burger" and "Fries"
    When Preparation of the "Burger" is complete
    And Preparation of the "Fries" is failed
    Then Kitchen prepares the "Fries"
    When Preparation of the "Fries" is complete
    Then Kitchen marks the order as "ready for pickup"
    When Customer "A" picks up the order for items "Burger" and "Fries"
    Then Kitchen marks the order as "complete"