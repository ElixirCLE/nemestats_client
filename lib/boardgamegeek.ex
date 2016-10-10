defmodule BoardGameGeek do
  @moduledoc """
  BoardGameGeek.com API wrapper

  Use this in clients to interact with BoardGameGeek's API.

  ## Examples

  defmodule MyClient do
    require BoardGameGeek

    def get_game_collection(username) do
      BoardGameGeek.post("collection?username=" <> username).body
    end
  end
  """

  use HTTPotion.Base

  def process_url(url) do
    "http://www.boardgamegeek.com/xmlapi2/" <> url
  end

  def process_request_headers(headers) do
    Dict.put(headers, :"Content-Type", "application/xml")
  end

  def process_response_body(body) do
    body
    |> IO.iodata_to_binary
  end
end
