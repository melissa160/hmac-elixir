defmodule Hmac do
  def main do
    message = "{name: melissa}"
    key = "135"
    {sign, error_status} = System.cmd("helisaSign", [key, message])

    case error_status do
      0 ->
        {:ok, String.trim(sign)}

      _ ->
        {:error, ""}
    end
  end
end
