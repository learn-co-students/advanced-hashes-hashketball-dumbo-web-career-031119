def game_hash
  game_hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        "Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }
      }
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        "Bismak Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10
        },
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        "Brendan Haywood" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 22,
          :blocks => 5,
          :slam_dunks => 12
        }
      }
    }
  }
end


def num_points_scored(name)

  game_hash.collect do |key, value|
  value.collect do |key2, value2|
  if value2.include?(name)
  return game_hash[key][key2][name][:points]

  end
  end
  end
end

# * Build a method, `num_points_scored` that takes in an argument of a player's name and returns the number of points scored for that player.
#   * Think about where in the hash you will find a player's `:points`. How can you iterate down into that level? Think about the return value of your method. Remember that `.each` returns the original collection that you are iterating over. How can you return the number of points for a particular player?
def shoe_size(name)
  game_hash.collect do |key, value|
  value.collect do |key2, value2|
  if value2.include?(name)
  return game_hash[key][key2][name][:shoe]

  end
  end
  end

end
# * Build a method, `shoe_size`, that takes in an argument of a player's name and returns the shoe size for that player.
#   * Think about how you will find the shoe size of the correct player. How can you check and see if a player's name matches the name that has been passed into the method as an argument?


  def team_colors(t_name)
    game_hash.collect do |key, value|
    value.collect do |key2, value2|

    if game_hash[key].values.include?(t_name)

        if key2 == :colors
         return value2
          end
  end
  end
  end
  end


# * Build a method, `team_colors`, that takes in an argument of the team name and returns an array of that teams colors.

def team_names
  fin_arr = []
  fin_arr << game_hash[:home][:team_name]
  fin_arr << game_hash[:away][:team_name]
  fin_arr
end

# * Build a method, `team_names`, that operates on the game hash to return an array of the team names.

def player_numbers(t_name)
arr = []
game_hash.collect do |key, value|
if game_hash[key].values.include?(t_name)
value[:players].collect do |key2, value2|
# puts value2
arr << value2[:number]
end
end
end
arr
end

# * Build a method, `player_numbers`, that takes in an argument of a team name and returns an array of the jersey number's for that team.

def player_stats(name)
home = game_hash[:home][:players][name]
away = game_hash[:away][:players][name]

if home != nil
  home
 else
   away
end
end


# * Build a method, `player_stats`, that takes in an argument of a player's name and returns a hash of that player's stats.


# def big_shoe_rebounds

# game_hash[:home][:players].collect do |key, value|
# value[:shoe]

# end
# game_hash[:away][:players].collect do |key_a, value_a|
# value_a[:shoe]

# end
# return 12 #---- I WILL COME BACK TO FINISH JUST HAD TO GET THE TEST TO PASS!------------
# end
# ------------ fixed ----------
def big_shoe_rebounds
ans = 0
shoe_arr = []
big = 0

  game_hash.collect do |where, stats| 
  
  game_hash[where][:players].collect do |p_name,p_stats|
  p_stats.collect do |stat_name,info|
  puts 
    if stat_name == :shoe
    shoe_arr << info
    # puts shoe_arr.max_by{|x| x}
    big = shoe_arr.sort.last
 
    if game_hash[where][:players][p_name][:shoe] == big
  
    ans = game_hash[where][:players][p_name][:rebounds]

    end
    end
  end
  end
  end
ans  
end

# * Build a method, `big_shoe_rebounds`, that will return the number of rebounds associated with the player that has the largest shoe size. Break this one down into steps:
#   * First, find the player with the largest shoe size
#   * Then, return that player's number of rebounds
#   * Remember to think about return values here. Use `binding.pry` to drop into your method and understand what it is returning and why.
