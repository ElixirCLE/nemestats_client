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

  @doc """
  Picks a random game from the list.
  Returns a `%Game{}` where min_players <= num_players <= max_players.

  ## Examples
      iex> games = [%Game{name: "Game1", min_players: 2, max_players: 4},
      ...> %Game{name: "Game2", min_players: 4, max_players: 10},
      ...> %Game{name: "Game3", min_players: 6, max_players: 12}]
      iex> GamePicker.pick_game(games, 5)
      %Game{name: "Game2", min_players: 4, max_players: 10}
  """
  def pick_game(games, num_players) do
    games
    |> filter_min_players(num_players)
    |> filter_max_players(num_players)
    |> Enum.random
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
  def filter_min_players(games, num_players) do
    Enum.filter(games, fn(game) -> Map.get(game, :min_players) <= num_players end)
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
  def filter_max_players(games, num_players) do
    Enum.filter(games, fn(game) -> Map.get(game, :max_players) >= num_players end)
  end
end
