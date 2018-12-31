## Hints and pseudo code for Exercise 6.6.3 (Axelrod, 1980)

1. Implement the following five strategies:

	- always cooperate
	- always defect
	- random: cooperate with probability 12 , and defect otherwise
	- tit for tat: cooperate on the first turn, then do whatever the other player did in the previous turn
	- tit for two tat: start by cooperating, and defect only if the other player has defected twice in a row

	Each strategy should be a function, accepting as input a list storing the
	previous turns of the game, and returning 1 for cooperate and 0 for defect.

	**Hints**: note that some strategies are deterministic (e.g., always cooperate, tit for tat), while some are random; moreover, some use information on what the other player played last, and as such we need to pass the moves of the other player to the function.

	**Pseudocode**:

	```python
	def name_of_the_strategy(previous_moves_other_player):
	    if given other player's last move we should cooperate:
	       return 1
	    else:
	       return 0
	```

2. Write a function that accepts the names of two strategies and plays them against each other in a game of iterated prisoner's dilemma for a given number of turns. Who wins between `random` and `always_defect`? And between `random` and `tit_for_tat`?

	**Hints**: this is how you can match the name of the function directly:

	**Pseudocode**:

	```python
	def play_strategies(strategy_1, strategy_2, nsteps = 200):
	    pl1 = globals()[strategy_1]
	    pl2 = globals()[strategy_2]
	    # We create two vectors to store the moves of the players
	    steps_pl1 = []
	    steps_pl2 = []
	    # and two variables for keeping the scores. 
	    # (because we said these are numbers of years in prison, we 
	    # use negative payoffs, with less negative being better)
	    points_pl1 = 0
	    points_pl2 = 0
	    # Iterate over the number of steps
	    for i in range(nsteps):
        	# decide strategy for player 1 and 2
	        # calculate payoff
		if both cooperate: -1 point each
	        # if pl2 loses: -3 to pl2, 0 to pl1
	        # if pl1 lose: -3 to pl1, 0 to pl2
	        # if both defect: -2 points each
	        # add the moves to the history
	    # return the final scores
	    return((points_pl1, points_pl2))
	```

3. Implement a round-robin tournament in which each strategy is played against every other (including against itself) for 10 rounds of 1000 turns each. Who is the winner?

	**Hints**: for this, you will need to cycle through each pair of strategies. Create a list of strategy names, and then create two nested for loops: the first goes through all strategies, the second only from the current onward.

