Feature: Pass command line arguments

Scenario: Receive status messages
Given I have a file called <filepath> And it's contents are '<contents>'
When I call cargo run -- <searchstring> <filepath>
Then I receive the response '<result>'
Examples:
|filepath|searchstring|contents|result|
|empty.txt|myword||Searching for myword\nIn file empty.txt|