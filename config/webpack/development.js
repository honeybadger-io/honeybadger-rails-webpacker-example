const environment = require('./environment')

module.exports = environment.toWebpackConfig()
// NOTE: devtool cheap-eval-source-map will cause CSP errors in dev mode
module.exports['devtool'] = 'source-map';
