# NemeStatsClient

[![Build Status](https://travis-ci.org/ElixirCLE/nemestats_client.svg?branch=master)](https://travis-ci.org/ElixirCLE/nemestats_client)

An Elixir wrapper around the [NemeStats API](http://docs.nemestatsapiversion2.apiary.io)

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add `nemestats_client` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:nemestats_client, "~> 0.1.0"}]
    end
    ```

  2. Ensure `nemestats_client` is started before your application:

    ```elixir
    def application do
      [applications: [:nemestats_client]]
    end
    ```

