defmodule HmacTest do
  use ExUnit.Case
  doctest Hmac

  test "greets the world" do
    assert Hmac.hello() == :world
  end
end
