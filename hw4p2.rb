class WrongNumberOfPlayersError <  StandardError ; end
class NoSuchStrategyError <  StandardError ; end

def rps_game(play1, play2) 
	wins = { "pr" => "p", "ps" => "s", "rs" => "r"} 
	str = [play1[1].downcase , play2[1].downcase].sort.join
	if wins[str] == play2[1].downcase then 
		play2 
	else 
		play1 
	end
end 

def rps_game_winner(game)
    raise WrongNumberOfPlayersError unless game.length == 2
    # your code here
    game.each do |move|
    	if "rps".index(move[1].downcase) == nil then 
    		raise NoSuchStrategyError 
    	end 
    end 
    rps_game game[0], game[1]
end

print rps_game_winner [ ["Armando", "P"], ["Dave", "S"] ]
print "\n"
print rps_game_winner [ ["Richard", "R"],  ["Michael", "S"] ]
print "\n"

tourney = [
    [
        [ ["Armando", "P"], ["Dave", "S"] ],
        [ ["Richard", "R"],  ["Michael", "S"] ],
    ],
    [
        [ ["Allen", "S"], ["Omer", "P"] ],
        [ ["David E.", "R"], ["Richard X.", "P"] ]
    ]
]

# since the data is well-formed. we simply flatten the data and 
# play games in each round.
def rps_tournament_winner(games)
	data = games.flatten

	done = false
	while !done do 
		ind = 0
		arr = []
		while ind < data.length do 
			win = rps_game_winner([[data[ind], data[ind+1]], [data[ind+2], data[ind+3]]])
			ind = ind + 4
			arr << win.flatten
			#print "Winner #{win}\n"
		end	
		data = arr.flatten
		if data.length == 2 then 
			done = true 
		end
		#print "Round over #{data}\n"
	end 
	data
end

print "Tourname winner #{rps_tournament_winner(tourney)} \n"

