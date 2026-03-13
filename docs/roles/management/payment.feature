Feature: Payment Management

  Scenario: Customer pays for an order
    Given Menu item "Burger" exist on the menu with a price of 10 euros
    Given Menu item "Fries" exist on the menu with a price of 3 euros
    Given Customer "A" occupies table "1"
    Given Customer "A" orders menu items "Burger" and "Fries"
    When Customer "A" requests to pay
    Then Host requests price for menu items from the kitchen
    Then Host requests payent for 13 euros from Customer "A"
    When Customer "A" provides payment of 13 euros
    Then Host closes tab on table "1" and marks the order as "paid"
    Then Host marks table "1" as available