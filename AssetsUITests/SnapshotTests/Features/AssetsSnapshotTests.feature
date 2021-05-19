@Login
Feature: Login tests
  As a user, I want to be able to login to do more action

  Scenario: Login successfully

    Given User has launched app
    Given User stay in "login" screen
    When User enter "wangwenwensh" into the "usernameTextField"
    When User enter "1" into the "passwordTextField" field
    Then User tap "loginButton" Button
    Then User should be navigated to "service" screen
