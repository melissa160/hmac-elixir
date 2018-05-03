defmodule Hmac do
  def main do
    message = ""
    key = ""
    message_hex = Base.encode16(message, case: :lower)

    IO.puts("hexadecimal message: ")
    IO.puts(message)
    # Base.encode16(key, case: :lower)
    key_hex = :crypto.hash(:sha256, key)
    IO.inspect(key_hex)

    key_hmac =
      :crypto.hmac_init(:sha256, key_hex)
      |> :crypto.hmac_update(message_hex)
      |> :crypto.hmac_final()
      |> Base.encode16(case: :lower)

    firma_key =
      :crypto.hmac(:sha256, key, message)
      |> Base.encode16(case: :lower)

    IO.puts(firma_key)
    IO.puts(key_hmac)
  end

  def toBits(str) do
    out = []
    str = str |> String.replace(~r/\s|0x/, "")

    len = String.length(str)
    str = (str <> "00000000") |> String.slice(0, 8) |> String.to_integer(16)
  end
end
