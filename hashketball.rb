# Write your code here!
require  'pry'

def game_hash
  hasketball = {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black","White"],
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
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise","Purple"],
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

def num_points_scored(player_name)
  #checks through both teams and their info
  game_hash.each do |location, team_data|
    #goes through each player and their stats
    team_data[:players].each do |player, player_data|
      #if the player called is on the team roster
      if player == player_name
        # alert their avg points per game
        return player_data[:points]
      end
    end
  end
end


def shoe_size(player_name)
  #checks through the both teams and their info
  game_hash.each do |location, team_data|
    #goes through each player and their stats
    team_data[:players].each do |player, player_data|
      #if the name asked for is in the team roster
      if player == player_name
        #alert their shoe size
        return player_data[:shoe]
      end
    end
  end
end

def team_colors(team_n)
  #checks through the both teams and their info
  game_hash.each do |location, team_data|
    #if the name asked for is one of the teams playing
    if team_data[:team_name] == team_n
      #alert what the team colors are
      return team_data[:colors]
    end
  end
end

def team_names
  #collects data from both teams
  game_hash.collect do |location, team_data|
    #alert the name of the team based on the data collected
    team_data[:team_name]
  end
end


def player_numbers(team_n)
  #create a jersey list
  jersey_numbers =[]
  #checks through the both teams and their info
  game_hash.each do |location, team_data|
    #if the team called is playing
    if team_data[:team_name] == team_n
      #gather the players and their stats
      team_data[:players].collect do |player, stats|
        #add all the jersey numbers to a list
        jersey_numbers << stats[:number]
      end
    end
  end
  #announce the list
jersey_numbers
end


def player_stats(players_name)
  #checks through the both teams and their info
  game_hash.each do |location, team_data|
    #gather the players and their stats
    team_data[:players].collect do |player, stats|
      #if the player called is playing on the team
      if player == players_name
        #alert their game stats
        return stats
      end
    end
  end
end


def big_shoe_rebounds
  largest_shoe = 0
  rebounds = 0
  game_hash.each do |location, team_data|
    team_data[:players].each do |player, stats|
      shoe_size = stats[:shoe]
      if shoe_size > largest_shoe
        largest_shoe = shoe_size
        rebounds = stats[:rebounds]
      end
    end
  end
  rebounds
end
