# class Animal

#     def species
#       "cat"
#     end
#   end

# #   maru = Animal.new()
# #   puts Animal.new().species()
  
#   maru = Animal.new
#   hanna = Animal.new

#   puts maru == hanna


#~~~~~~~Problem 4

# class Animal
  
#     def species 
#       @my_species = "cat"
#     end
  
#     def say_species
#       puts "Hi! I'm a #{@my_species}"
#     end
#   end

#   maru = Animal.new
#   maru.species
#   maru.say_species

#~~~~~~~~~ Problem 5

class Animal

    def initialize(name)
        @name = name
    end
    
    def species
        puts @name
    end
end

x = "dog"
frederick = Animal.new("bull" + x)
frederick.species