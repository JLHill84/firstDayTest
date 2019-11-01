# class FunnyBots  
 
#     attr_accessor :name, :quotes  
 
#     @@bots = []
 
#     def initialize(name, quotes)
#       @name = name
#       @quotes = quotes
#       @@bots << self
#     end
 
#    def random_quote
#       self.quotes.sample
#     end
 
#     def self.bots
#       @@bots
#     end

#     def bots
#         @@bots.each do
#             puts @@bots
#         end
#     end
 
# end
 
#   archer = FunnyBots.new("Archer", ["Danger Zone!", "Read a book", "The cumulative hangover would literally kill me"] )
# #   puts archer.random_quote
#   batman = FunnyBots.new("Batman", ["I'm Batman.", "Alfred"])
#   robin = FunnyBots.new("Robin", ["Kapow", "Oooph!"])

# #   puts archer.bots
#   puts batman.bots


class Bicycle
 
    # attr_accessor :tire
   
      def initialize(tire, gears, style)
        @tire = tire
        @gears = gears
        @style = style
      end
   
      def tire_size=(num)
        @tire = num
        puts @tire
      end
   
      def gears
        @gears
      end
    
      def self.bikes
        puts "Cheese"

      end

      def self.styles
        puts "Rice"
        end
   
  end
   
  mongoose = Bicycle.new(4, 10, "BMX")

mongoose.tire_size = 5
