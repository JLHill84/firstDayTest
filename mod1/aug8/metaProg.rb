class User
    attr_accessor :name, :age, :location, :user_name
   
    def initialize(user_name:, name:, age:, location:)
      @user_name = user_name
      @name = name
      @location = location
      @age = age
    end
  end