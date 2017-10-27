const { environment } = require('@rails/webpacker')
const HoneybadgerSourceMapPlugin = require('@honeybadger-io/webpack')

const revision = process.env.GIT_COMMIT || 'master' // See 12-factor app / Heroku notes in README

environment.plugins.set(
  'HoneybadgerSourceMap',
  new HoneybadgerSourceMapPlugin({
    api_key: process.env.HONEYBADGER_API_KEY,
    assets_url: process.env.ASSETS_URL,
    silent: false,
    ignoreErrors: false,
    revision: revision
  }))

module.exports = environment
