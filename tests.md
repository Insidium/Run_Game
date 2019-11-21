# Manual Tests

### Test 1: 

### Test 2: Recent games should print to an array in correct format

Once a game has completed and the player has seen the result message in the terminal, the name of the player (or monster if a lost is experienced) should be added to an array in the format: 'Name' - 'Result'. 

After interacting with this part of the game via the 'File' class and it's methods, I checked the results log option in the menu. The results of the game didn't print to the array correctly. It showed as items running into each other. This test failed. 

What went wrong was that the individual results weren't splitting at any point. To correct the operation, I needed to use the 'split' method and target the split on a specified separating string (in this case: '%&#' ).