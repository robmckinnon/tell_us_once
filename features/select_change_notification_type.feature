Feature: Select change notification type
  In order to notify govt of a change
  as a submitter
  I want to choose the notification type

  Scenario: View notification options
    Given I am on the home page
    Then I should see "Tell Us Once"
    And I should see "Birth"
    And I should see "Change of address"
    And I should see "Death"
