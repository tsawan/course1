class Numeric
 @@currencies = {'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019, 'dollar' => 1.000}
 def method_missing(method_id)
   singular_currency = method_id.to_s.gsub( /s$/, '')
   if @@currencies.has_key?(singular_currency)
     self * @@currencies[singular_currency]
   else
     super
   end
 end

 def in(currency)
    singular_currency = currency.to_s.gsub(/s$/, '')
    if @@currencies.has_key?(singular_currency)
    	self / @@currencies[singular_currency]
    else
    	super
    end
  end
end

puts 5.dollars.in(:euros)
puts 10.euros.in(:rupees)
puts 1.dollar.in(:rupees)
puts 10.rupees.in(:euro)

class String
  def palindrome?
    letters = self.downcase.scan(/\w/)
    revd = letters.reverse
  	letters == revd
  end
end

puts "A man, a plan, a canal -- Panama".palindrome?
puts "Abracadabra".palindrome?

module Enumerable
  def palindrome?
	arr2 = self.to_a.reverse
	arr2 == self
  end 
end

puts [4,2,3,2,1].palindrome?
puts [1,2,3,2,1].palindrome?
