# SessionService

A session microservice written in Elixir and Phoenix


# Generate a key for Guardian

1. Create an OpenSSL key.

```bash
$ openssl ecparam -name secp521r1 -genkey -noout -out ec-secp521r1.pem
```

2. Run the Elixir REPL with Mix to load all project dependencies.

```bash
$ iex -S mix
```

3. Use `JOSE.JWK.from_pem_file/1` and `JOSE.JWK.to_map/1` to print the contents of the key. The argument to the
former is the name of the file created in (1).


```elixir
iex> jwk = JOSE.JWK.from_pem_file("ec-secp521r1.pem")
...

iex> JOSE.JWK.to_map jwk
{%{kty: :jose_jwk_kty_ec},
 %{"crv" => "P-521",
   "d"   => "...",
   "kty" => "..",
   "x"   => "...",
   "y"   => "..."}}

```

4. Copy the contents of the map to the Guardian configuration section. (Keys should not be committed to Github.
Use environment variables and best practices to configure keys in production.)

```elixir
config :guardian, Guardian,
  issuer:         "SessionService",
  secret_key:
    %{
      "crv" => "<crv from previous step>",
      "d"   => "<d>",
      "kty" => "<kty>",
      "x"   => "<x>",
      "y"   => "<y>" },
  serializer:     SessionService.GuardianSerializer,
  ttl:            { 30, :days }
```




# Run the code

To start your Phoenix app:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `npm install`
  * Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).


# References

## Learn more about Phoenix

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
