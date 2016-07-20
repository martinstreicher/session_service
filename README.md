# SessionService

A session microservice written in Elixir and Phoenix.


# Purpose

The purposes of SessionService are:

* Ascribe a _unique user identifier_ (or _UUID_) to every visitor of a site.

	Combined with a modicum of client-side Javascript, the UUID can track the
	visitor across a collection of sites.

* Create a credential given an email address and password (via the
separate Authentication Service).

* Attach one or more _credentials_ to the UUID.

	A credential, such as an email address and password pair or an Oauth
	credential, provides for the recovery of a previously-assigned UUID and full
	restoration of a past session. (Any number of other microservices can
	persist information given a credential, including preferences, browsing history,
	and contact information.)


## Workflow Examples

The API for Session Service is described in an (Apiary document)[https://github.com/martinstreicher/session_service/blob/master/apiary.apib].

This section explains how to consume the API to realize a number of common site features.

### Track a visitor across many sites.

### Register new credentials to save a session.

### Login to recover a previous session.

### Login via Facebook to save a session.

### Add Facebook as a second credential.

### Remove Facebook as a credential.

### Combine a visitor's session with a previously-created, credentialed session.


# Boot your Environment

Use source code or your operating system's package manager to install these packages:

* Elixir

* npm

* OpenSSL

* PostgreSQL

* Redis


# Generate a key for Guardian

1. Copy _config/dev.secrets.exs.example_ to _config/dev.secrets.exs_ to bootstrap application configuration.

2. Copy the following snippet into the configuration file for each environment. For production, say,
copy the code to _config/prod.secrets.exs_. (The example secrets file provided for development
already contains the snippet.) Do not replace the values in `<>` yet.

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


3. Create an OpenSSL key. This command produces an _EC_-type key in the
file named _ec-secp521r1.pem_.(Learn more about generating keys in the
[JSON Object Signing and Encryption documentation](https://hexdocs.pm/jose/key-generation.html)).

		$ openssl ecparam -name secp521r1 -genkey -noout -out ec-secp521r1.pem


3. Run the Elixir REPL with Mix to load all of the project dependencies.

		$ iex -S mix


5. Use `JOSE.JWK.from_pem_file/1` and `JOSE.JWK.to_map/1` to convert the key into a readable map. The argument to
`JOSE.JWK.from_pem_file/1` is the name of the file generated in (2), here _ec-secp521r1.pem_. (Portions of
the output have been elided to obscure the values of the map.)

		iex> JOSE.JWK.to_map JOSE.JWK.from_pem_file("ec-secp521r1.pem")
		{%{kty: :jose_jwk_kty_ec},
		 %{"crv" => "P-521",
			 "d"   => "Aco1U...6Dx5",
			 "kty" => "EC",
			 "x"   => "AK2yL...0fSX",
			 "y"   => "Afzjz...hGn9"}}


6. Copy the value of each key in the map above to the corresponding key in the Guardian
configuration created in (1). The end result should resemble this (portions of the
secrets have been elided):

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

	If you choose to use another form of key, such as OKP, the map may differ. For instance, OKP adds
	an `alg` key and omits the `y` key.


7. Supplant the placeholders `<local database username>` and `<username's database password>`
in _config/dev.secrets.exs_ with the name and password of a local, capable database user.
Here, the name is `martini` and the password is `someunlikelypassword`.

		config :session_service, SessionService.Repo,
			username: "martini",
			password: "someunlikelypassword"

	Ensure that the configuration files for other environments also
	have proper, working database credentials.


In general, user names, passwords, certificates, and keys should not be committed
to Github. Use environment variables and best practices to configure credentials.



# Run the code

To start your Phoenix app:

	* Install dependencies with `mix deps.get`
	* Create and migrate your database with `mix ecto.create && mix ecto.migrate`
	* Install Node.js dependencies with `npm install`
	* Start Phoenix endpoint with `mix phoenix.server`

Now visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).



# Running Integration Tests
The session_service uses [hound](https://github.com/HashNuke/hound) to run integration tests. In
order to run the tests, you need a webdriver installed. This project uses [chromedriver](https://sites.google.com/a/chromium.org/chromedriver/).

To install ChromeDriver:
```
$ brew install chromedriver
```

By default, integration tests are not run with `$ mix test` (because they are slow)

To run the tests you need chromedriver and a phoenix server running:
```
$ chromedriver (in a seperate terminal)
$ mix phoenix.server (in a seperate terminal)
$ mix test.all
```
This opens the chromedriver on `port 9515`.



# References

## Libraries and Technologies

* [Guardian, authentication for Elixir](https://github.com/ueberauth/guardian)

* [JSON Object Signing and Encryption](https://hexdocs.pm/jose)


## Learn more about Phoenix

	* Official website: http://www.phoenixframework.org/
	* Guides: http://phoenixframework.org/docs/overview
	* Docs: https://hexdocs.pm/phoenix
	* Mailing list: http://groups.google.com/group/phoenix-talk
	* Source: https://github.com/phoenixframework/phoenix
