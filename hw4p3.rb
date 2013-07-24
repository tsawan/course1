def combine_anagrams(words)
    result = [] 
    words.each do |word| 
    	sorted_word = word.downcase.chars.sort.join
    	found = false
    	result.each do |anag| 
    		if anag.class.to_s == "Array" then 
    			first_word = anag[0].downcase.chars.sort.join 
    			if first_word == sorted_word then 
    				anag << word
    				found = true 
    			end 
    		end 
    	end 
    	result << [word] unless found 
    end 
    print result
    result 
end

combine_anagrams ['cars', 'for', 'potatoes', 'racs', 'four', 'scar', 'creams', 'scream'] 
