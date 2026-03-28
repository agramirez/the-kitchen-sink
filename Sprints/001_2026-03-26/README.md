# Sprint 001: 2026-03-26

In this sprint we will develop the following functionality;

A UI to allow an unmarried tax filer to create an account, login/authenticate to the app, enter their Gross Income and calculate their tax burden.

## User Stories (Gherkin)
As a New User
Given that I go to the Main page
When I click on the Login link
Then I see the Login or Register page

As a New User
Given that I am on the Login or Register page
When I click on the Register link
Then I see the Register page

As a New User
Given that I am on the Register page
When I start my registration
    And enter my email address
    And enter my name
    And click on the Register button
Then I see the Verify Email page
    And a message is displayed asking me to enter my OTP code

As a New User
Given that I am on the Verify Email page
When I receive my OTP code in my email within the last 15 minutes
    And I enter the correct code as sent to my email
    And I click the Verify button
Then I see the Home page
    And a message telling me the email verification was successful


As a New User
Given that I am on the Verify Email page
When I receive my OTP code in my email more than 15 minutes ago
    And I enter the correct code as sent to my email
    And I click the Verify button
Then I see the Verify Email page
    And a message telling me that the verification code expired 
    And a new one is sent to my email

