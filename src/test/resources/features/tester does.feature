# Theme 1 (Standard Regression), Test 7:
# Tester does:
#   MOT test
#   Retest
#   Abort
#   Add RFR Failures to a FAIL
#   Add PRS Failures to a PASS
#   Add advisory tests to both FAIL and PASS
#   Add, Edit, Remove a defect.
Feature: Tester does...

  Scenario: Tester enters an MOT test pass
    Given I login with 2FA as username JOEN5622
    When I click the "Start MOT test" link

    And The page title contains "Find a vehicle"
    And I enter "HO94LFW" in the "Registration mark" field
    And I enter "452484" in the "VIN" field
    And I press the "Search" button

    And The page title contains "Find a vehicle"
    And I click the "Select vehicle" link

    And The page title contains "Confirm vehicle and start test"
    And I press the "Confirm and start test" button

    And The page title contains "MOT test started"
    And I click the "Home" link

    And The page title contains "Your home"
    And I click the "Enter test results" link

    And The page title contains "MOT test results"
    And I click the "Add reading" link

    And The page title contains "Odometer reading"
    And I enter "120000" in the field with id "odometer"
    And I press the "Update reading" button

    And The page title contains "MOT test results"
    And I click the "Add brake test" link

    And The page title contains "Brake test configuration"
    And I select "Decelerometer" in the "Service brake test type" field
    And I select "Decelerometer" in the "Parking brake test type" field
    And I press the "Next" button

    And The page title contains "Add brake test results"
    And I enter "60" in the "Service brake" field
    And I enter "60" in the "Parking brake" field
    And I press the "Submit" button

    And The page title contains "Brake test summary"
    And I click the "Done" link

    And The page title contains "MOT test results"
    And I press the "Review test" button

    And The page title contains "MOT test summary"
    And I press the "Save test result" button

    Then The page title contains "MOT test complete"
