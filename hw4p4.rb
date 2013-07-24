class Dessert
    def initialize(name, calories)
        @name = name 
        @calories = calories
    end

    def name=(new_name) 
    	@name = new_name
    end 

    def name
    	@name 
    end 

    def calories=(new_calories)
    	@calories = new_calories
    end 

    def calories
    	@calories
    end

    def healthy?
        @calories < 200
    end

    def delicious?
        true
    end
end

class JellyBean < Dessert 
	def initialize(name, calories, flavor)
        super(name,calories)
        @flavor = flavor 
    end

    def delicious?
        if @flavor == "black licorice" then 
        	false 
        else 
        	super
        end
    end

    def flavor=(new_flavor) 
    	@flavor = new_flavor
    end 

    def flavor
    	@flavor 
    end
end

dessert = Dessert.new("ice cream", 400)
print "des1 #{dessert.healthy?} \n"

dessert = Dessert.new("candy", 50)
print "des2 #{dessert.healthy?} \n"

jb = JellyBean.new("candy", 200, "black licorice")
print "JB delicious #{jb.delicious?}, healthy #{jb.healthy?} \n"
