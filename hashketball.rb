require 'pry'

def num_points_scored(name)
  game_hash.each {|x,y|
    if game_hash[x][:players][name]
      return (game_hash[x][:players][name][:points])
    end
  }
end

def shoe_size(name)
  game_hash.each {|x,y|
    if game_hash[x][:players][name]
      return (game_hash[x][:players][name][:shoe])
    end
  }
end

def team_colors(name)
  game_hash.each {|x,y|
    if game_hash[x][:team_name] == name
      return game_hash[x][:colors]
    end
  }
end

def team_names
  game_hash.collect{|x,y| game_hash[x][:team_name]}
end

def player_numbers(name)
  ans = Array.new
  game_hash.each {|x,y|
    if game_hash[x][:team_name] == name
      game_hash[x][:players].each {|x,y|
        y.each {|x,y|
          if x.to_s == "number"
            ans.push(y)
          end
        }
      }
    end
  }
  ans
end

def player_stats(name)
  game_hash.each {|x,y| 
    if game_hash[x][:players][name]
      return game_hash[x][:players][name] 
    end
  }
end

def big_shoe_rebounds
  shoe = Array.new
  rebound = Array.new
  game_hash.each {|x,y|
    game_hash[x][:players].each {|x,y|
      y.each {|x,y|
        if x == :shoe
          shoe.push(y)
        elsif x == :rebounds
          rebound.push(y)
        end
      }
    }
  }
  rebound[shoe.index(shoe.max)]
end

def most_points_scored
  points = Array.new
  names = Array.new
  game_hash.each {|x,y|
    game_hash[x][:players].each {|x,y|
      names.push(x)
      y.each {|x,y|
        if x == :points
          points.push(y)
        end
      }
    }
  }
  names[points.index(points.max)]
end

def winning_team
  teams = Array.new
  points = Array.new
  game_hash.each {|x,y|
    teams.push(game_hash[x][:team_name])
    points.push(0)
    game_hash[x][:players].each {|x,y|
      y.each {|x,y|
        if x == :points
          points[points.length-1] += y
        end
      }
    }
  }
  teams[points.index(points.max)]
end

def player_with_longest_name
  names = Array.new
  game_hash.each {|x,y|
    game_hash[x][:players].each {|x,y|
      names.push(x)
    }
  }
  names.sort {|x,y|
    x.length <=> y.length
  }
  names[names.length-1]
end

def long_name_steals_a_ton?
  ballin = player_with_longest_name
  steals = Array.new
  names = Array.new
  game_hash.each {|x,y|
    game_hash[x][:players].each {|x,y|
      names.push(x)
      y.each {|x,y|
        if x == :steals
          steals.push(y)
        end
      }
    }
  }
  actually_ballin = names[steals.index(steals.max)]
  if actually_ballin = ballin
    puts "Yep! #{ballin} is the one true G."
    return true
  else
    puts "Nah, #{ballin} is a loser. It's all about #{actually_ballin} these days - get with the times man."
    return false 
  end
end

def game_hash
  {
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