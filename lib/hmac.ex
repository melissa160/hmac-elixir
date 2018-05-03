defmodule Hmac do
  def main do
    message = ""
    key = "1"
    message_hex = Base.encode16(message, case: :lower)

    IO.puts("hexadecimal message: ")
    IO.puts(message)
    key_hex = Base.encode16(key, case: :lower)

    key_hmac = :crypto.hmac_init(:sha256, key) |> :crypto.hmac_final()

    firma_key = :crypto.hmac(:sha256, key_hex, message) |> Base.encode16(case: :lower)
  end
end
