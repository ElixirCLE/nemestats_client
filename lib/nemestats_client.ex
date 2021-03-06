defmodule NemeStatsClient do
  @moduledoc """
  Client for interacting with Nemestats.
  """

  require NemeStats

  def login(username, password) do
    body = Poison.encode!(%{userName: username, password: password})
    NemeStats.post("UserSessions/", [body: body]).body
  end

  def get_stats(:player, gaming_group, player_id) do
    NemeStats.get("GamingGroups/#{gaming_group}/PlayerStats/#{player_id}/").body
  end

  def get_stats(_, _, _), do: nil
end
