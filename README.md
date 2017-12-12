# Honeybadger+Rails+Webpacker+Source Maps Example

An example Rails 5.1/Webpacker application demonstrating honeybadger's webpack
plugin to emit a source map to un-minify JavaScript. The source map is uploaded to
the Honeybadger API, allowing JavaScript exception reporting with correct
references to un-minified JavaScript.

This example application was originally created with the rails new command:

```sh
rails new . --webpack --skip-active-record --skip-action-mailer
```

## Demonstration

Clone the example app, bundle install:

```sh
git clone https://github.com/honeybadger-io/honeybadger-rails-webpacker-example.git
gem install bundler
bundle install
```

Create a Honeybadger Project for your application in the Honeybadger panel at
`https://app.honeybadger.io/projects/` and record its API Key into the
project's dotenv file `.env`. If your api key is abc123 then the entry in
`.env` will be `HONEYBADGER_API_KEY=abc123`.

A very simple webpack style JavaScript example can be found in
`app/javascript/src/main.js`. It can be compiled with the webpacker compile
task `rake webpacker:compile` and will be automatically compiled by the rails
server in development mode:

```sh
./bin/rake webpacker:compile
./bin/rails server
```

Open the application in your browser and open the browser's development console
so you can see the application's JavaScript debug log lines. Click the `ABC`
button for a simple code path that doesn't cause an exception. Click the `BOOM`
button to cause the example exception path to execute. If your Honeybadger
project has been correctly configured the `boom` exception should be sent to
Honeybadger.

## Heroku / 12-factor app

This example application is ready to run out on Heroku (or any other 12-factor
app using ENV VARs as in the .env example) given these deployment notes.

A git post commit hook can be utilzied to set a revision environment variable
at Heroku that is utilized in `config/webpack/environment.js` to set the
revision variable in the `@honeybadger-io/webpack` plugin.

```sh
# this is in .git/hooks/post-commit
# be sure to
# chmod +x .git/hooks/post-commit
commit=$(git rev-parse HEAD)
echo Setting Heroku GIT_COMMIT env var to $commit
heroku config:set GIT_COMMIT=$commit
```

Set your Honeybadger API key in your app's heroku environment.

```sh
heroku config:set HONEYBADGER_API_KEY=abcd1234
```

Set ASSETS_URL to your applications base application directory

```sh
heroku config:set ASSETS_URL=http://my-example.herokuapp.com/packs
```


## NOTES

See `config/webpack/development.js` webpacker's default `devtool` setting of
`cheap-eval-source-map` will cause CORs related errors in the development
environment when exceptions are sent to Honeybadger. The value is changed to
`cheap-eval-source-map` to overcome that.


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
