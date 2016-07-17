# SessionService

A session microservice written in Elixir and Phoenix


# Generate a key for Guardian

1. Copy the following snippet into your application configuration. In development mode, for example,
copy the code to _config/dev.secrets.exs_. Do not replace the values in `<>` yet.

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

2. Create an OpenSSL key.

		```bash
		$ openssl ecparam -name secp521r1 -genkey -noout -out ec-secp521r1.pem
		```


3. Run the Elixir REPL with Mix to load all of the project dependencies.

		```bash
		$ iex -S mix
		```


4. Use `JOSE.JWK.from_pem_file/1` and `JOSE.JWK.to_map/1` to print the contents of the key. The argument to the
former is the name of the file created in (1).

		```elixir
		iex> jwk = JOSE.JWK.from_pem_file("ec-secp521r1.pem")
		...

		iex> JOSE.JWK.to_map jwk
		{%{kty: :jose_jwk_kty_ec},
		 %{"crv" => "P-521",
			 "d"   => "Aco1U...6Dx5",
			 "kty" => "EC",
			 "x"   => "AK2yL...0fSX",
			 "y"   => "Afzjz...hGn9"}}
		```


5. Copy the value of each key in the map above to the corresponding key in the Guardian
configuration you created in (1). The end result should resemble this (portions of the
secrets have been elided):

		```elixir
		config :guardian, Guardian,
			issuer:         "SessionService",
			secret_key:
				%{
					"crv" => "P-521",
					"d"   => "Aco1U...6Dx5",
					"kty" => "EC",
					"x"   => "AK2yL...0fSX",
					"y"   => "Afzjz...hGn9" },
			serializer:     SessionService.GuardianSerializer,
			ttl:            { 30, :days }
		```

In general, keys should not be committed to Github. Use environment variables and best practices to
configure keys in production.)


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
