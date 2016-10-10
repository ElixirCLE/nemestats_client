defmodule BoardGameGeekClient do
  @moduledoc """
  Client for interacting with BoardGameGeek.
  """

  require BoardGameGeek

  def get_game_collection(username) do
    url = "collection?username=" <> username <> "&own=1&subtype=boardgame"
    response = BoardGameGeek.post(url)
    doc = get_response(url, response, response.status_code)
    game_ids = Exml.get doc, "//items/item/@objectid"
    get_games_info([], game_ids)
  end

  defp get_games_info(games_list, [head | tail]) do
    url = "thing?id=" <> head
    response = BoardGameGeek.post(url)
    doc = get_response(url, response, response.status_code)
    name = Exml.get doc, "//items/item/name[@type='primary']/@value"
    min_players = Exml.get doc, "//items/item/minplayers/@value"
    max_players = Exml.get doc, "//items/item/maxplayers/@value"

    # We need to add the sleep because making requests too fast will cause BGG to close the connection
    # Ideal solution: Just get the game names/ids, then start a background process to update min/max players
    :timer.sleep(500)
    get_games_info(games_list ++ [%Game{name: name, min_players: String.to_integer(min_players),
                   max_players: String.to_integer(max_players)}], tail)
  end

  defp get_games_info(games_list, []) do
    games_list
  end

  defp get_response(url, _, status_code) when status_code == 202 do
    :timer.sleep(500)
    response = BoardGameGeek.post(url)
    get_response(url, response, response.status_code)
  end

  defp get_response(_, response, _) do
    response.body
    |> Exml.parse
  end
end
