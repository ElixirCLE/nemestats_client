defmodule NemeStatsClient do
  require NemeStats

  @games [
             %Game{name: "BANG!", min_players: 4, max_players: 7},
             %Game{name: "Betrayal at House on the Hill", min_players: 3, max_players: 6},
             %Game{name: "Boss Monster", min_players: 2, max_players: 4},
             %Game{name: "Codenames", min_players: 2, max_players: 8},
             %Game{name: "Exploding Kittens", min_players: 2, max_players: 8},
             %Game{name: "Hunters of Arcfall", min_players: 2, max_players: 6},
             %Game{name: "IncrediBrawl", min_players: 2, max_players: 4},
             %Game{name: "Love Letter", min_players: 2, max_players: 4},
             %Game{name: "Mascarade", min_players: 2, max_players: 13},
             %Game{name: "One Night Ultimate Werewolf", min_players: 3, max_players: 10},
             %Game{name: "Saboteur", min_players: 3, max_players: 10},
             %Game{name: "Salem", min_players: 4, max_players: 12},
             %Game{name: "Samurai Sword", min_players: 3, max_players: 7},
             %Game{name: "Secret Hitler", min_players: 5, max_players: 10},
             %Game{name: "Shadow Hunters", min_players: 4, max_players: 8},
             %Game{name: "Small World", min_players: 2, max_players: 5},
             %Game{name: "Spyfall", min_players: 3, max_players: 8},
             %Game{name: "Sushi Go!", min_players: 2, max_players: 5},
             %Game{name: "The Resistance", min_players: 5, max_players: 10},
             %Game{name: "The Resistance: Avalon", min_players: 5, max_players: 10},
             %Game{name: "Till Dawn", min_players: 4, max_players: 8},
             %Game{name: "Tsuro", min_players: 2, max_players: 8},
             %Game{name: "Zombie Dice", min_players: 2, max_players: 99}
           ]

  def login(username, password) do
    body = Poison.encode!(%{userName: username, password: password})
    NemeStats.post("UserSessions/", [body: body]).body
  end

  def pick_game(num_players) do
    GamePicker.pick_game(@games, num_players)
    |> Map.get(:name)
  end
end
