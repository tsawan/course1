def palindrome?(string)
	string = string.scan(/[a-zA-Z]/).join
	string.downcase == string.reverse.downcase
end

puts palindrome?("A man, a plan, a canal -- Panama")
puts palindrome?("Madam, I'm Adam!")                  
puts palindrome?("Abracadabra")

def count_words(string)
	res = {} 
	string.scan(/\w+\b/).each do |word|
		word = word.downcase
		res[word] = res.key?(word) ? res[word] + 1 : 1
	end
	res 
end

puts count_words("A man, a plan, a canal -- Panama")
puts count_words "Doo bee doo bee doo"
