defmodule BoardGameGeekClient do
  @moduledoc """
  Client for interacting with BoardGameGeek.
  """

  require BoardGameGeek

  def get_game_collection(username) do
    BoardGameGeek.post("collection?username=" <> username <> "&own=1&subtype=boardgame").body
  end
end
