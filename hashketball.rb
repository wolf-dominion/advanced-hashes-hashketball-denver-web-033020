require 'pp'

def game_hash
  {
    :home => {:team_name => 'Brooklyn Nets',
              :colors => ['Black', 'White'], 
              :players =>[
                {
                  :player_name => 'Alan Anderson',
                  :number => 0,
                  :shoe => 16,
                  :points => 22,
                  :rebounds => 12,
                  :assists => 12,
                  :steals => 3,
                  :blocks => 1,
                  :slam_dunks => 1
                },
                  {:player_name => 'Reggie Evans',
                  :number => 30,
                  :shoe => 14,
                  :points => 12,
                  :rebounds => 12,
                  :assists => 12,
                  :steals => 12,
                  :blocks => 12,
                  :slam_dunks => 7
                },
                {:player_name => 'Brook Lopez',
                          :number => 11,
                          :shoe => 17,
                          :points => 17,
                          :rebounds => 19,
                          :assists => 10,
                          :steals => 3,
                          :blocks => 1,
                          :slam_dunks => 15
                        },
                          {:player_name => 'Mason Plumlee',
                          :number => 1,
                          :shoe => 19,
                          :points => 26,
                          :rebounds => 11,
                          :assists => 6,
                          :steals => 3,
                          :blocks => 8,
                          :slam_dunks => 5
                        },
                          {:player_name => 'Jason Terry',
                          :number => 31,
                          :shoe => 15,
                          :points => 19,
                          :rebounds => 2,
                          :assists => 2,
                          :steals => 4,
                          :blocks => 11,
                          :slam_dunks => 1
                          }
                          ]
                        }, 
                  :away => {:team_name => 'Charlotte Hornets', 
                     :colors => ['Turquoise', 'Purple'], 
                     :players =>[
                       {:player_name => 'Jeff Adrien',
                                  :number => 4,
                                  :shoe => 18,
                                  :points => 10,
                                  :rebounds => 1,
                                  :assists => 1,
                                  :steals => 2,
                                  :blocks => 7,
                                  :slam_dunks => 2
                                },
                                  {:player_name => 'Bismack Biyombo',
                                  :number => 0,
                                  :shoe => 16,
                                  :points => 12,
                                  :rebounds => 4,
                                  :assists => 7,
                                  :steals => 22,
                                  :blocks => 15,
                                  :slam_dunks => 10
                                },
                                  {:player_name => 'DeSagna Diop',
                                  :number => 2,
                                  :shoe => 14,
                                  :points => 24,
                                  :rebounds => 12,
                                  :assists => 12,
                                  :steals => 4,
                                  :blocks => 5,
                                  :slam_dunks => 5
                                },
                                  {:player_name => 'Ben Gordon',
                                  :number => 8,
                                  :shoe => 15,
                                  :points => 33,
                                  :rebounds => 3,
                                  :assists => 2,
                                  :steals => 1,
                                  :blocks => 1,
                                  :slam_dunks => 0
                                },
                                  {:player_name => 'Kemba Walker',
                                  :number => 33,
                                  :shoe => 15,
                                  :points => 6,
                                  :rebounds => 12,
                                  :assists => 12,
                                  :steals => 7,
                                  :blocks => 5,
                                  :slam_dunks => 12
                                  }
                                  ]
                                  }
                                }
end

def playersArray
  home_players = game_hash[:home][:players]
  away_players = game_hash[:away][:players]

  home_players.concat away_players
end

def find_player (players_name)
  playersArray.find do |player|
    player[:player_name] == players_name
  end
end

=begin
def num_points_scored(name)
  game_hash.each do |location, teamInfo|
    teamInfo[:players].each do |playerInfo|
      if playerInfo[:player_name] == name
        return playerInfo[:points]
      end
    end
  end
end
=end

def num_points_scored players_name
  # equivalent is: find_player(players_name)[:points]
  found_player = find_player players_name
  found_player[:points]
end

=begin
def shoe_size(name)
  game_hash.each do |location, teamInfo|
    teamInfo[:players].each do |playerInfo|
      if playerInfo[:player_name] == name
        return playerInfo[:shoe]
      end
    end
  end
end
=end

def shoe_size(name)
  found_player = find_player name
  found_player[:shoe]
end

=begin
def team_colors(team)
  game_hash.each do |location, teamInfo|
    teamInfo.each do |teamInfo_key, teamInfo_value|
      if teamInfo_key == :team_name
        if teamInfo_value == team
          return teamInfo[:colors]
        end
      end
    end 
  end
end
=end

def get_team_by_name team_name
  game_hash.values.find do |team|
    team[:team_name] == team_name
  end
end

def team_colors(team_name)
  matching_team = get_team_by_name team_name
  matching_team[:colors]
end

def team_names()

  teamNamesArray = []
  game_hash.each do |location, teamInfo|
    teamInfo.each do |teamInfo_key, teamInfo_value|
      if teamInfo_key == :team_name
        teamNamesArray << teamInfo_value
      end
    end
  end
  teamNamesArray
end

def player_numbers(team_name)

  teamNumbers = []
  game_hash.each do |location, teamInfo|
    if teamInfo[:team_name] == team_name
      teamInfo[:players].each do |playerStats|
        teamNumbers << playerStats[:number]
      end
    end
  end
  teamNumbers
end

def player_stats(name)
  game_hash.each do |location, teamInfo|
      teamInfo[:players].each do |player_stats|
        if player_stats[:player_name] == name
          return player_stats.tap {|hs| hs.delete(:player_name)}
        end
      end
    end
end

def big_shoe_rebounds()
  maxRebound = 0
  maxShoe = 0
  game_hash.each do |location, teamInfo|
    teamInfo[:players].each do |player_stats|
      if player_stats[:shoe] > maxShoe
        maxShoe = player_stats[:shoe]
        maxRebound = player_stats[:rebounds]
      end
    end
  end
  return maxRebound
end