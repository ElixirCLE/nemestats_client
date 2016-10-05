defmodule GamePicker do
  @moduledoc """
  Choose a game that matches criteria

  ## Examples
      iex> games = [%Game{name: "Game1", min_players: 2, max_players: 4},
      ...> %Game{name: "Game2", min_players: 4, max_players: 10},
      ...> %Game{name: "Game3", min_players: 6, max_players: 12}]
      iex> GamePicker.pick_game(games, 5)
      %Game{name: "Game2", min_players: 4, max_players: 10}
  """

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

  def games, do: @games

  @doc """
  Picks a random game from the list.
  Returns a `%Game{}` where min_players <= num_players <= max_players.

  ## Examples
      iex> games = [%Game{name: "Game1", min_players: 2, max_players: 4},
      ...> %Game{name: "Game2", min_players: 4, max_players: 10},
      ...> %Game{name: "Game3", min_players: 6, max_players: 12}]
      iex> GamePicker.pick_game(games, 5)
      %Game{name: "Game2", min_players: 4, max_players: 10}
      
      iex> games = [%Game{name: "Game1", min_players: 2, max_players: 4}]
      iex> GamePicker.pick_game(games, 1)
      nil
  """
  def pick_game(games_list, num_players) do
    games_list
    |> filter_min_players(num_players)
    |> filter_max_players(num_players)
    |> Enum.take_random(1)
    |> List.first
  end

  @doc """
  Filtes a list of games by the minimum number of players.
  Returns a filtered list of `%Game{}`s.

  ## Examples
      iex> games = [%Game{name: "Game1", min_players: 2, max_players: 4},
      ...> %Game{name: "Game2", min_players: 3, max_players: 5}]
      iex> GamePicker.filter_min_players(games, 2)
      [%Game{name: "Game1", min_players: 2, max_players: 4}]
  """
  def filter_min_players(games_list, num_players) do
    Enum.filter(games_list, fn(game) -> Map.get(game, :min_players) <= num_players end)
  end

  @doc """
  Filters a list of games by the maximum number of players.
  Returns a filtered list of `%Game{}`s.

  ## Examples
      iex> games = [%Game{name: "Game1", min_players: 2, max_players: 4},
      ...> %Game{name: "Game2", min_players: 3, max_players: 5}]
      iex> GamePicker.filter_max_players(games, 5)
      [%Game{name: "Game2", min_players: 3, max_players: 5}]
  """
  def filter_max_players(games_list, num_players) do
    Enum.filter(games_list, fn(game) -> Map.get(game, :max_players) >= num_players end)
  end
end
