@regression
Feature: 24 - Verify Q&A policy is enabled and working

  Scenario: Verify that the user is able to login to their user account and change their security questions and answers according to the new policy.
    #Login with 2FA and go to the change security questions link in profile page
    Given I login with 2FA using "2FA_CARD_USER" as {username1}, {site}, {q1}, {q2}
    And I click the "Your profile" link
    And The page title contains "Your profile"
    And I click the "Change your security questions" link

    #Validate the user by entering their password
    And I enter "Password1" in the field with id "Password"
    And I press the "Continue" button

    #Q&A1 - Select a question from the dropdown, enter a common answer and submit and verify the correct error is shown.
    And The page title contains "First security question - MOT testing service"
    And I select "What was the name of your first pet?" in the field with id "question1"
    And I enter "answer" in the field with id "answer1"
    And I press the "Continue" button
    Then The page contains "There was a problem with the information you entered:"
    Then The page contains "First memorable answer - must not be a common answer"
    Then The page contains "Must not be a common answer"

    #Q&A1 - Enter an answer over 71 characters and submit to see the correct error message is shown.
    And I enter "This is an answer of 71 characters which will then given an error message that it is too long" in the field with id "answer1"
    And I press the "Continue" button
    Then The page contains "There was a problem with the information you entered:"
    Then The page contains "First memorable answer - must be shorter than 71 characters"
    Then The page contains "Must be shorter than 71 characters"

    #Q&A1 - Enter an answer shorter than 6 characters and submit to see the correct error message is shown.
    And I enter "ans" in the field with id "answer1"
    And I press the "Continue" button
    Then The page contains "There was a problem with the information you entered:"
    Then The page contains "First memorable answer - must be at least 6 characters"
    Then The page contains "Must be at least 6 characters"

    #Q&A1 - Now enter a valid answer that meets the security policy criteria for q1 and continue.
    And I enter "Secure answer33" in the field with id "answer1"
    When I press the "Continue" button

    #Q&A2 - Select question from dropdown, enter same answer as answer 1 and submit, verify correct error message is shown.
    And The page title contains "Second security question - MOT testing service"
    And I select "Where did you go on your first school trip?" in the field with id "question2"
    And I enter "Secure answer33" in the field with id "answer2"
    When I press the "Continue" button
    Then The page contains "There was a problem with the information you entered:"
    Then The page contains "Second memorable answer - security answers must not be the same"
    Then The page contains "Security answers must not be the same"

    #Q&A2 - Enter blank spaces into the answer field and click submit, then verify the correct error message is shown.
    And I enter " " in the field with id "answer2"
    When I press the "Continue" button
    Then The page contains "There was a problem with the information you entered:"
    Then The page contains "Second memorable answer - enter a memorable answer"
    Then The page contains "Enter a memorable answer"

    #Q&A2 - Enter a valid answer that meets the security policy criteria for q2 and continue.
    And I enter "Secure answer44" in the field with id "answer2"
    And I press the "Continue" button

    #Review the security question changes by verifying page title and content on the page.
    Then The page title contains "Review security question changes - MOT testing service"
    And The page contains "Review security question changes"
    And The page contains "What was the name of your first pet?"
    And The page contains "Secure answer33"
    And The page contains "Where did you go on your first school trip?"
    And The page contains "Secure answer44"

    #Save changes, verify that changes are saved and then signout of MTS.
    And I press the "Save Changes" button
    And The page title contains "Your security questions have been changed - MOT testing service"
    And The page contains "Your security questions have been changed"
    And The page contains "You can change your account security – including your password and security questions – at any time from your profile."
    And I click the "Sign out" link