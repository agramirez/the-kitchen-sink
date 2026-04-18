Feature: Call from command line

Scenario: Call via cargo run
Given I have a file called example-filename.txt And it's contents are empty
When I call cargo run -- searchstring example-filename.txt
Then I receive the response 0 matches found