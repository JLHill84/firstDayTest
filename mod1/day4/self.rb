class Dog
 
    attr_accessor :name, :owner
   
    def initialize(name)
      @name = name
    end

    def get_adopted(owner_name)
        self.owner = owner_name
    end
   
  end

  fido = Dog.new("fido")
#   adopted(fido, "Steve")
  puts fido.get_adopted("Cheesus")
#   puts fido.name = "FIDO"