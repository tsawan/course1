class Class
  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s
    attr_reader attr_name

    attr_reader attr_name+"_history" # create bar_history getter

    class_eval %Q{
      def #{attr_name}=(value)
        @#{attr_name}=value
        @#{attr_name}_history ||= [nil] 
        @#{attr_name}_history << value
      end

      def #{attr_name}_history 
        @#{attr_name}_history || [nil]
      end
    }

  end    
end

class Foo
    attr_accessor_with_history :bar
end

f = Foo.new     # => #<Foo:0x127e678>
f.bar = 3       # => 3
f.bar = :wowzo  # => :wowzo
#f = Foo.new
f.bar = 'boo!'  # => 'boo!'
print f.bar_history   # => [nil, 3, :wowzo, 'boo!']

g = Foo.new 
print g.bar_history
