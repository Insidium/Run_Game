# Manual Tests

### Test 1: User should only be able to choose a room between 1 and 6

When a user selects their first room to venture into, the only valid inputs should be 1 through to 6. Once selected, the user will be assigned to that room and the game will show them where they are in the next dialogue options section. 

After repeated play throughs to check that all these inputs worked, I discovered that numbers outside of this range and even string numbers like 'two' were being accepted (two converted to integer as 0). This was a failed test.

After reviewing the logic around this selection, I saw that I was specifying the range but I wasn't limiting it enough using a loop. I implemented an 'until' loop that stated: until the current room selection is greater than zero and less than or equal to six, the dialogue will throw an error about an invalid input and request another selection. Once a valid selection has been entered, the game can continue. The test has now passed.

### Test 2: Recent games should print to an array in correct format

Once a game has completed and the player has seen the result message in the terminal, the name of the player (or monster if a lost is experienced) should be added to an array for later output in the format: 'Name' - 'Result'. 

After interacting with this part of the game via the 'File' class and it's methods, I checked the results log option in the menu. The results of the game didn't print to the array correctly. It showed as items running into each other with no spaces or separation. This was a failed test. 

What went wrong was that the individual results weren't splitting at any point. To correct the operation, I needed to use the 'split' method and target the split on a specified separating string (in this case: '%^&' ). Upon re-running the same operation, the output was correct and as such, the test passed.