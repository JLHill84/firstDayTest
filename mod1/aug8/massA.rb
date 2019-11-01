# def happy_birthday(name: "Carmelo Anthony", current_age: 31)
#     puts "Happy Birthday, #{name}"
#     current_age += 1
#     puts "You are now #{current_age} years old"
#   end

#   happy_birthday

class Person
    attr_accessor :name, :age
   
    def initialize(name:, age:)
      @name = name
      @age = age
    end
  end

  josh = Person.new(name: "Joshua Hill", age: 35)
  puts josh.name
  puts josh.age