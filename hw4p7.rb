class CartesianProduct
    include Enumerable

    def initialize(seq1, seq2) 
    	@seq1 = seq1
    	@seq2 = seq2 
    end 

    def each() 
		@seq1.each do |s1|
			@seq2.each do |s2| 
				yield [s1, s2]
			end   
		end
	end
end

c = CartesianProduct.new([:a,:b], [4,5])
c.each { |elt| puts elt.inspect }
# [:a, 4]
# [:a, 5]
# [:b, 4]
# [:b, 5]

c = CartesianProduct.new([:a,:b], [])
c.each { |elt| puts elt.inspect }
# Nothing printed since Cartesian product of anything with an empty collection is empty
