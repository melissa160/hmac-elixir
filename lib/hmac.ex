defmodule Hmac do
  def main do
    message = "hola mundo"
    key = ""
    IO.puts("hexadecimal message: ")
    IO.puts(Base.encode16(message, case: :lower))

    message_hex = Base.encode16(message, case: :lower)

    firma_key = :crypto.hmac(:sha256, key, "") |> Base.encode16()
    :crypto.hmac(:sha256, firma_key, message_hex) |> Base.encode16()
  end
end
