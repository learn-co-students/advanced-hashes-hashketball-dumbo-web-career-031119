# Write your code here!
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

def num_points_scored(player)
  game_hash.each do |loc, team|
    team.each do |starter, stats|
      if stats.include?(player) 
        return game_hash[loc][starter][player][:points]
      end
    end
  end
end

def shoe_size(player)
  game_hash.each do |loc, team|
    team.each do |starter, stats|
      if stats.include?(player) 
        return game_hash[loc][starter][player][:shoe]
      end
    end
  end   
end

def team_colors(team_name)
  game_hash.each do |loc, team|
    if game_hash[loc].values.include?(team_name)
      team.each do |deet, stats|
        if deet == :colors
          return stats
        end
      end
    end
  end    
end

def team_names
  new_array = []
  game_hash.each do |loc, team|
    team.each do |deet, stats|
      if deet == :team_name
        new_array.push(stats)
      end
    end
  end  
  new_array
end 

def player_numbers(team_name)
  new_array = []
  game_hash.each do |loc, team|
    if game_hash[loc].values.include?(team_name)
      team.each do |deet, info|
        if info.class == Hash
          info.each do |player, stats|
            stats.each do |stat, num|
              if stat == :number
                new_array.push(num.to_i)
              end
            end
          end
        end
      end
    end
  end
  new_array
end

def player_stats(name)
   game_hash.each do |loc, team|
    team.each do |deet, info|
      if deet == :players
        info.each do |player, stats|
          if player == name
            return stats  
          end 
        end 
      end
    end
  end
end 

def big_shoe_rebounds
  shoe_size = 0
  name = ""
  game_hash.each do |loc, team|
    team.each do |deet, info|
      if info.class == Hash
        info.each do |player, stats|
          stats.each do |stat, num|
            if stat == :shoe
              if shoe_size < num
                shoe_size = num
                name = player
                
              end
            end
          end
        end
        return game_hash[loc][deet][name][:rebounds]
      end
    end
  end
end







