defmodule Terraformer.Support.JWT do
  import Joken

  # TODO: enable expiration
  # @ttl 300
  @secret "secret"

  def encode(sub, payload \\ %{}) do
    payload
    |> token
    |> with_sub(sub)
    # |> with_exp(now() + @ttl)
    |> with_signer(hs256(@secret))
    |> sign
    |> get_compact
  end

  def decode(string) do
    string
    |> token
    |> with_signer(hs256(@secret))
    # |> with_validation("exp", &(&1 > now()))
    |> verify
  end

  def validate_for_sub(string, sub) do
    %Joken.Token{claims: claims, error: error} = decode(string)
    with nil <- error do
      if sub == claims["sub"], do: {:ok, claims}, else: {:error, "sub claim mismatch: expected #{sub}, got #{claims["sub"]}"}
    else
      err -> {:error, err}
    end
  end

  def decode!(string) do
    %Joken.Token{claims: claims, error: error} = decode(string)

    with nil <- error do
      claims["sub"]
    else
      err -> raise "Terraformer.Support.JWT.decode! - #{err} - probably expired token or invalid signature"
    end
  end

  defp now, do: :os.system_time(:seconds)
end
