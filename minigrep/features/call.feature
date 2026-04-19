Feature: Pass command line arguments

Scenario: Receive status messages
Given I have a file called <filepath> And it's contents are <contents>
When I call cargo run -- <searchstring> <filepath>
Then I receive the response '<result>'
Examples:
|filepath|searchstring|contents|result|
|empty.txt|myword||Searching for myword\nIn file empty.txt\nWith file contents hash 3476900567878811119|
|single.txt|myword|myword|Searching for myword\nIn file single.txt\nWith file contents hash 12801026223259057687|
|poem.txt|myword|I'm nobody! Who are you?\nAre you nobody, too?\nThen there's a pair of us - don't tell!\nThey'd banish us, you know.\n\nHow dreary to be somebody!\nHow public, like a frog\nTo tell your name the livelong day\nTo an admiring bog!|Searching for myword\nIn file poem.txt\nWith file contents hash 2179486464545165624|