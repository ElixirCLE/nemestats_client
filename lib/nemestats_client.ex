defmodule NemeStatsClient do
  require NemeStats

  def login(username, password) do
    {:ok, body} = JSX.encode(
      %{
        userName: username,
        password: password,
        preserveExistingAuthenticationToken: true
      })
#    NemeStats.post("UserSessions/", [body: body])
    response = HTTPotion.post("https://nemestats.com/api/v2/UserSessions/", [body: body, headers: ["Content-Type": "application/json"]]).body
    {:ok, session} = JSX.decode(response)
    Enum.map(session, fn({k, v}) -> {String.to_atom(k), v} end)
  end
end
