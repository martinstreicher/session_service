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

The API for Session Service is described in an [Apiary document](https://github.com/martinstreicher/session_service/blob/master/apiary.apib). The API documentation is also [available as HTML](http://htmlpreview.github.io/?https://raw.githubusercontent.com/martinstreicher/session_service/master/apiary.html?token=AAB6V8fRBZoe3e43ucOsJ8XBttKytRXEks5XmUkewA%3D%3D).


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


# Generate HTML documentation

The Session Service API is documented in [Apiary](https://github.com/martinstreicher/session_service/blob/master/apiary.apib).
An HTML version of the document can be generated easily with [_aglio_](https://github.com/danielgtaylor/aglio), a Blueprint renderer.

	$ npm install -g aglio
	$ aglio -i apiary.apib -o apiary.html
	$ open apiary.html

Regenerate and commit the HTML each time you update the Apirary document.


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
