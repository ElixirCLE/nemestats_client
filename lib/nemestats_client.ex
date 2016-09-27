defmodule NemeStatsClient do
  require NemeStats

  def login(username, password) do
    body = Poison.encode!(
      %{
        userName: username,
        password: password,
        preserveExistingAuthenticationToken: true
      })
    NemeStats.post("UserSessions/", [body: body]).body
  end
end
