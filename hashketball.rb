require 'pry'
def game_hash
  game_hash = {
    :home => {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
        "Alan Anderson" => {
            number: 0,
            shoe: 16,
            points: 22,
            rebounds: 12,
            assists: 12,
            steals: 3,
            blocks: 1,
            slam_dunks: 1
        },
        "Reggie Evans" => {
            number: 30,
            shoe: 14,
            points: 12,
            rebounds: 12,
            assists: 12,
            steals: 12,
            blocks: 12,
            slam_dunks: 7
        },
        "Brook Lopez" => {
            number: 11,
            shoe: 17,
            points: 17,
            rebounds: 19,
            assists: 10,
            steals: 3,
            blocks: 1,
            slam_dunks: 15
        },
        "Mason Plumlee" => {
            number: 1,
            shoe: 19,
            points: 26,
            rebounds: 12,
            assists: 6,
            steals: 3,
            blocks: 8,
            slam_dunks: 5
        },
        "Jason Terry" => {
            number: 31,
            shoe: 15,
            points: 19,
            rebounds: 2,
            assists: 2,
            steals: 4,
            blocks: 11,
            slam_dunks: 1
        }
      }
    },

    :away => {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: {
        "Jeff Adrien" => {
            number: 4,
            shoe: 18,
            points: 10,
            rebounds: 1,
            assists: 1,
            steals: 2,
            blocks: 7,
            slam_dunks: 2
        },
        "Bismak Biyombo" => {
            number: 0,
            shoe: 16,
            points: 12,
            rebounds: 4,
            assists: 7,
            steals: 7,
            blocks: 15,
            slam_dunks: 10
        },
        "DeSagna Diop" => {
            number: 2,
            shoe: 14,
            points: 24,
            rebounds: 12,
            assists: 12,
            steals: 4,
            blocks: 5,
            slam_dunks: 5
        },
        "Ben Gordon" => {
            number: 8,
            shoe: 15,
            points: 33,
            rebounds: 3,
            assists: 2,
            steals: 1,
            blocks: 1,
            slam_dunks: 0
        },
        "Brendan Haywood" => {
            number: 33,
            shoe: 15,
            points: 6,
            rebounds: 12,
            assists: 12,
            steals: 22,
            blocks: 5,
            slam_dunks: 12
        }
      }
    }
  }
end

def num_points_scored(player)
  game_hash.each do  |opp, info|
    info.each do |team, att|
      if att.include?(player)
        return att[player][:points]

      end
    end
  end
end

def shoe_size(player)
  game_hash.each do |team, info|
    info.each do |key, stat|
      if key === :players
        if game_hash[team][:players].keys.include?(player)
          return game_hash[team][:players][player][:shoe]
        end
      end
    end
  end
end

def team_colors(teamName)
  game_hash.each do |opp, info|
    info.each do |team, att|
      if att.include?(teamName)
        return game_hash[opp][:colors]
      end
    end
  end
end

def team_names
  game_hash.map do |opp, info|
    game_hash[opp][:team_name]
  end
end

def player_numbers(team)
  arr = []
  game_hash.each do |teams, info|
    if game_hash[teams].values.include?(team)
      info[:players].map do |key, val|
      arr << val[:number]
    end
    end
  end
  arr
end

def player_stats(player)
  stat = game_hash

  stat.each do |h_a, att|
    att.each do |key, info|
      if info.include?(player)
        return stat[h_a][key][player]
      end
    end
  end
end

def big_shoe_rebounds
  rebounds = 0
  biggest_shoe = 0
  hash = game_hash

  hash.each do |h_a, info|
    info[:players].each do |str, hsh|
      if biggest_shoe < hsh[:shoe]
        biggest_shoe = hsh[:shoe]
        rebounds = hsh[:rebounds]
      end
    end
  end
  rebounds
end
