class FibSeq 
	include Enumerable

	def initialize(cnt)
		
		arr = []
		i = 0 
		while i < cnt do
			if i < 2 then
				arr << 1 
			else
				arr << arr[i-1] + arr[i-2]
			end
			i+=1
		end
		@arr = arr
	end

	def each() 
		@arr.each do |elt| 
			yield elt 
		end
	end

end

f = FibSeq.new(6) 
f.each { |s| print(s,':')}
r1 = f.reject { |s| s.odd? }
r2 = f.map { |e| 2*e } 
print r1.to_s
print r2.to_s

