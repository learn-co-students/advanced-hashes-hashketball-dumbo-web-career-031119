require "pry"


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
          :slam_dunks => 5,
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
points_scored = ""
   game_hash.each do |location, team_data|
      team_data[:players].each do |player_name, data|
         if player_name == name
         data.each do |key,value|
           if key == :points 
         points_scored = value 
         end
      end 
    end 
   end
   end 
   points_scored   
end

def shoe_size(player_name)
  shoe = ""
  game_hash.each do |location,team_data|
    team_data.each do |attribute,values|
      if attribute == :players
        values.each do |person,data|
          data.each do |k,v|
          if person == player_name && k == :shoe
                 shoe = data[:shoe]
              end 
            end
          end
        end
      end
    end
   shoe
end


def player_numbers(team)
  new_array = []
  if game_hash[:home][:team_name] == team
    game_hash[:home][:players].each do |name, stats|
      stats.each do |stat_label, stat_value|
        if stat_label == :number
          new_array << stat_value
        end
      end
    end
  else 
    game_hash[:away][:players].each do |name, stats|
      stats.each do |stat_label, stat_value|
        if stat_label == :number
          new_array << stat_value
        end
      end
    end
  end
  new_array
end

def team_colors(team)
  new_array = ""
  game_hash.each do |keys, values|
    values.each do |data_labels, data|
      if data == team
        new_array = game_hash[keys][:colors]
      end
    end
  end
  new_array
end

def team_names
array2 = []
  game_hash.each do |location, team_data|
      team_data.each do |attribute, values|
          if attribute == :team_name
                array2.push(values)
            end
          end
  end
  return array2
end


def player_stats(name)
  player_stats = []
  game_hash.each do |home_away, team_info|
    team_info.each do |data_label, data|
      if data_label == :players
        data.each do |player_name, stats|
          if player_name == name 
          player_stats = stats
          end
        end
      end
    end
  end
   return player_stats
end

def big_shoe_rebounds
 player_rebounds = ""

  game_hash.each do |location,team_data|
    team_data.each do |attribute,data|
      if attribute == :players
        data.each do |names,stat|
          if stat[:shoe] > 18
            player_rebounds = stat[:rebounds]
          end
        end
      end
    end
  end
  player_rebounds
end
