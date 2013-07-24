bb = [
    [
        [ ["Armando", "P"], ["Dave", "S"] ],
        [ ["Richard", "R"],  ["Michael", "S"] ],
    ],
    [
        [ ["Allen", "S"], ["Omer", "P"] ],
        [ ["David E.", "R"], ["Richard X.", "P"] ]
    ]
]


def game(p1, p2) 
	r = Random.new 
	n = r.rand(2) 
	if n == 0 then 
		p1 
	else
		p2 
	end
end 

def play(dt)
	b2 = dt.flatten

	done = false
	while !done do 
		ind = 0
		arr = []
		while ind < b2.length do 
			win = game([b2[ind], b2[ind+1]], [b2[ind+2], b2[ind+3]])
			ind = ind + 4
			arr << win.flatten
#			print "Winner #{win}\n"
		end	
		b2 = arr.flatten
		if b2.length == 2 then 
			done = true 
		end
#		print "Round over #{b2}\n"
	end 
	b2
end

print "winner is #{play(bb)} \n"

 