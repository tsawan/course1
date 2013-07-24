module Enumerable

	def each_with_custom_index(start, step) 
		self.each do |elt| 
			yield elt, start 
			start += step 
		end
	end

end

%w(alice bob carol).each_with_custom_index(3,2) do |person,index|
  puts ">> #{person} is number #{index}"
end

