Feature: Order Management

  Scenario: Customer places an order
    Given Menu item "Burger" exist on the menu
    Given Menu item "Fries" exist on the menu
    When Customer "A" orders menu items "Burger" and "Fries"
    Then Customer "A" receives confirmation for order with items "Burger" and "Fries"
    Then Host sends the order to the kitchen
    When Kitchen confirms receipt of the order
    And Kitchen marks the order as "ready for pickup"
    Then Host retrieves and delivers the order from the kitchen for items "Burger" and "Fries"
    Then Host marks the order as "complete"

  Scenario: Customer places an order with non existent item
    Given Menu item "Burger" exist on the menu
    When Customer "A" orders menu items "Burger" and "Fries"
    Then Customer "A" receives refusal for order with item "Fries"