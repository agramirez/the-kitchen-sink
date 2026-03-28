Feature: Registration

Scenario: Go to Login/Register page
Given that I am at the "Home" page
When I click on the "Login/Register" link
Then I will be taken to the "Login/Register" page

Scenario: Go to Register page
Given that I am at the "Login/Register" page
When I click on the "Register" link
Then I will be taken to the "Register" page

Scenario: Enter registration details
Given that I am at the "Register" page
When I enter my "<email>"
    And I enter my "<password>"
    And I enter my "<confirmation_password>"
    And I click on the "Verify" link
Then I receive a message saying "<message>"
Examples:
    |email|password|confirmation_password|message|
    |agramirez@gmail.com|123456|123456|That is not a strong password.  Please choose a password with at least 2 numbers, 2 lowercase letters, 2 upper case letters, 2 symbols, and at least 14 total characters.|
    |agramirez|50m3P@55w0rdHereOK|50m3P@55w0rdHereOK|That is not a valid email address.  Please enter a valid email address such as email@domain.com|
    |agramirez@gmail.com|50m3P@55w0rdHereOK|50m3P@55w0rdHereOK|Thank you for registering.  Please verify your email address by entering the One Time Passcode in the Verify page or follow the link in the email.|

    


