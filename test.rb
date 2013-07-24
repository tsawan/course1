class Class
  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s
    attr_reader attr_name

    define_method "#{attr_name}_history" do
      instance_variable_get("@#{attr_name}_history") || [nil]
    end

    define_method "history" do |symb| 
    	a_name = symb.to_s 
    	instance_variable_get("@#{a_name}_history") || [nil]
    end

    define_method "#{attr_name}=" do |new_value|
      v = instance_variable_get("@#{attr_name}_history")
      v ||= [nil]
      v << new_value

      instance_variable_set("@#{attr_name}_history", v)
      instance_variable_set("@#{attr_name}", new_value)
    end
  end
end

class Example
  attr_accessor_with_history :foo
  attr_accessor_with_history :bar
end

a = Example.new; a.foo = 2; a.foo = 10 ; a.foo = "test"; 
puts a.foo_history.to_s 
puts a.history(:foo).to_s

a = Example.new
puts a.foo_history.to_s