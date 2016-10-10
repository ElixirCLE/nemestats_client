defmodule BoardGameGeekClient do
  @moduledoc """
  Client for interacting with BoardGameGeek.
  """

  require BoardGameGeek

  def get_game_collection(username) do
    response = BoardGameGeek.post("collection?username=" <> username <> "&own=1&subtype=boardgame")
    get_response(username, response, response.status_code)
  end

  defp get_response(username, _, status_code) when status_code == 202 do
    get_game_collection(username)
  end

  defp get_response(_, response, _) do
    response.body
  end
end
