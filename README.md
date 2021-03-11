# Honeybadger + Rails + Webpacker + Source Maps - Example Application

This example Rails 5.1/Webpacker application demonstrates Honeybadger's Webpack
plugin to emit a source map to un-minify JavaScript. The source map is uploaded
to the Honeybadger API, allowing JavaScript exception reporting with correct
references to un-minified JavaScript.

This example application was originally created with the rails new command:

```sh
rails new . --webpack --skip-active-record --skip-action-mailer
```
## Quick Start

The easiest way to get started with this application is to deploy it to Heroku
with the Heroku Button:

[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

Note that if you utilize the [honeybadger Heroku
addon](https://elements.heroku.com/addons/honeybadger) the addon will establish
and set the `HONEYBADGER_API_KEY` for your environment. You will also need to
set your `ASSETS_URL` environment variable; it corresponds to the `assetsUrl`
variable used to configure the [Honeybadger Webpack Source Map
Plugin](https://github.com/honeybadger-io/honeybadger-webpack).

## Slightly Less Quick Start

Clone the example app, bundle install:

```sh
git clone https://github.com/honeybadger-io/honeybadger-rails-webpacker-example.git
gem install bundler
bundle install
```

Create a Honeybadger Project for your application in the Honeybadger panel at
`https://app.honeybadger.io/projects/` and record its API Key into the project's
dotenv file `.env`. If your api key is "abc123", then the entry in `.env` will
be `HONEYBADGER_API_KEY=abc123`.

A very simple Webpack style JavaScript example can be found in
`app/javascript/src/main.js`. It can be compiled with the webpacker compile task
`rake webpacker:compile` and will be automatically compiled by the rails server
in development mode:

```sh
./bin/rake webpacker:compile
./bin/rails server
```

Open the application in your browser and open the browser's development console
so you can see the application's JavaScript debug log lines. Click the "Say
Hello" button for a simple code path that doesn't cause an exception. Click the
"Throw Error" button to cause the example exception path to execute. If your
Honeybadger project has been correctly configured, an error report should be
sent to Honeybadger.

## Heroku / 12-factor app

This example application is ready to run out on Heroku (or any other 12-factor
app using ENV VARs as in the .env example) given these deployment notes.

### `GIT_COMMIT`

In the example `app/javascript/src/main.js` the `revision` variable used in the
call to the Honeybadger API by honeybadger-js is sourced via an environment
variable `GIT_COMMIT`.  When Webpacker minifies the JavaScript it will use the
value of that variable from the local environment it is run in. Should your
implementation follow this pattern you will have to ensure a means of setting
the current commit SHA in your deployment environment. The default value for
`revision` is `master`.

### `HONEYBADGER_API_KEY`

In the example `app/javascript/src/main.js` the `apiKey` variable used in the
call to the Honeybadger API is sourced via an environment variable
`HONEYBADGER_API_KEY`. `HONEYBADGER_API_KEY` is also referenced by the Webpack
environment configuration of the Honeybadger Webpack plugin in
`config/webpack/environment.js`

Note that if you utilize the [honeybadger Heroku
addon](https://elements.heroku.com/addons/honeybadger) the addon will establish
and set the `HONEYBADGER_API_KEY` for you rather than managing it by hand.

Otherwise, set your Honeybadger API key in your app's Heroku environment:

```sh
heroku config:set HONEYBADGER_API_KEY=abc123
```

### `ASSETS_URL`

In the Webpack configuration `config/webpack/environment.js` the `assetsUrl`
variable used to configure the Honeybadger Webpack Source Map Plugin is sourced
via the environment variable `ASSETS_URL`. See the Honeybadger Webpack plugin's
[README](https://github.com/honeybadger-io/honeybadger-webpack) for explanation
of the plugin's configuration.

Set `ASSETS_URL` to your applications base application directory:

```sh
heroku config:set ASSETS_URL=http://my-example.herokuapp.com/packs
```

## NOTES

See `config/webpack/development.js`: Webpacker's default `devtool` setting of
`cheap-eval-source-map` will cause CORs related errors in the development
environment when exceptions are sent to Honeybadger. The value is changed to
`source-map` to overcome that.


## Development

First, install needed dependencies:

```sh
bundle install
yarn install --pure-lockfile
```

Then run the development servers:

```sh
./bin/rails server
./bin/webpack-dev-server
```

Alternatively, [foreman](http://ddollar.github.io/foreman/) may be used to start
both servers at once:

```sh
gem install foreman
foreman start
```
