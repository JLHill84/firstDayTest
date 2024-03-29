# require 'pry'

def game_hash
    game_hash = {
      :home => {
        :team_name => "Brooklyn Nets",
        :colors => "Black,White",
        :players => [
          
           {:player_name => "Alan Anderson",
            :number => 0,
            :shoe => 16,
            :points => 22,
            :rebounds => 12,
            :assists => 12,
            :steals => 3,
            :blocks => 1,
            :slam_dunks => 1},
          
           {:player_name => "Reggie Evans",
            :number => 30,
            :shoe => 14,
            :points => 12,
            :rebounds => 12,
            :assists => 12,
            :steals => 12,
            :blocks => 12,
            :slam_dunks => 7},
          
           {:player_name => "Brook Lopez",
            :number => 11,
            :shoe => 17,
            :points => 17,
            :rebounds => 19,
            :assists => 10,
            :steals => 3,
            :blocks => 1,
            :slam_dunks => 15},
          
           {:player_name => "Mason Plumlee",
            :number => 1,
            :shoe => 19,
            :points => 26,
            :rebounds => 11,
            :assists => 6,
            :steals => 3,
            :blocks => 8,
            :slam_dunks => 5},
          
           {:player_name => "Jason Terry",
            :number => 31,
            :shoe => 15,
            :points => 19,
            :rebounds => 2,
            :assists => 2,
            :steals => 4,
            :blocks => 11,
            :slam_dunks => 1}
            ]
      },
      
      :away => {
        :team_name => "Charlotte Hornets",
        :colors => "Turquoise,Purple",
        :players => [
          
           {:player_name => "Jeff Adrien",
            :number => 4,
            :shoe => 18,
            :points => 10,
            :rebounds => 1,
            :assists => 1,
            :steals => 2,
            :blocks => 7,
            :slam_dunks => 2},
          
           {:player_name => "Bismack Biyombo",
            :number => 0,
            :shoe => 16,
            :points => 12,
            :rebounds => 4,
            :assists => 7,
            :steals => 22,
            :blocks => 15,
            :slam_dunks => 10},
          
          {:player_name => "DeSagna Diop",
            :number => 2,
            :shoe => 14,
            :points => 24,
            :rebounds => 12,
            :assists => 12,
            :steals => 4,
            :blocks => 5,
            :slam_dunks => 5},
         
          {:player_name => "Ben Gordon",
            :number => 8,
            :shoe => 15,
            :points => 33,
            :rebounds => 3,
            :assists => 2,
            :steals => 1,
            :blocks => 1,
            :slam_dunks => 0},
         
          {:player_name => "Kemba Walker",
            :number => 33,
            :shoe => 15,
            :points => 6,
            :rebounds => 12,
            :assists => 12,
            :steals => 7,
            :blocks => 5,
            :slam_dunks => 12}
            ]
        }
    }
  end

def num_points_scored(player_name)
    game_hash.values.each do |team|
        team[:players].each do |player|
            return player[:points] if player[:player_name] == player_name
        end
    end
end

# puts num_points_scored("Kemba Walker")

def shoe_size(player_name)
    game_hash.values.each do |team|
        team[:players].each do |player|
            return player[:shoe] if player[:player_name] == player_name
        end
    end
end

# puts shoe_size("Kemba Walker")

def team_colors(team_name)
    game_hash.values.each do |team|
        if team[:team_name] == team_name
            return team[:colors]
        end
    end
end

# puts team_colors("Charlotte Hornets")

def team_name
    game_hash.values.map {|team| team[:team_name]}
end

# puts team_name

def player_numbers(team_name)
    myArray = []
    game_hash.values.each do |team|
        if team[:team_name] == team_name
            # puts team[:team_name]
            myArray = team[:players].map do |player|
                player[:number]
            end
        end
    end
puts myArray
end

# player_numbers("Charlotte Hornets")

def player_stats(player_name)
    myHash = {}
    game_hash.values.each do |team|
        team[:players].each do |player|
            if player[:player_name] == player_name
                myHash = player
            end
        end
    end
    puts myHash
end

# player_stats("Kemba Walker")

def big_shoe_rebounds
    bigShoe = 0
    game_hash.values.each do |team|
        team[:players].each do |player|
            if player[:shoe] > bigShoe
                bigShoe = player[:shoe]
            end
        end
    end
    bigShoe
end

# puts big_shoe_rebounds

def most_points_scored
    bigShoe = 0
    game_hash.values.each do |team|
        team[:players].each do |player|
            if player[:points] > bigShoe
                bigShoe = player[:points]
            end
        end
    end
    bigShoe
end

# puts most_points_scored

def winning_team
 homeArray = []
 awayArray = []
    game_hash[:home][:players].each do |player|
        homeArray << player[:points]
        end

        game_hash[:away][:players].each do |player|
            awayArray << player[:points]
            end

    # game_hash[:away].each do |key, value|
    #    awayArray= value[:players].map{ |player| player[:points]}
    #  end

     if homeArray.sum > awayArray.sum
        puts game_hash[:home][:team_name]
     else
        puts game_hash[:away][:team_name]
     end
    end

# winning_team

def player_with_longest_name
    bigShoe = 0
    biggestShoe = ""
    name_count = 0
    game_hash.values.each do |team|
        team[:players].each do |player|
            name_count = player[:player_name].length
            if name_count > bigShoe
                biggestShoe = player[:player_name]
            end
        end
    end
    puts biggestShoe
end

player_with_longest_name