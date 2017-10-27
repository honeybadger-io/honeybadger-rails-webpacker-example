module Git
  REVISION = ENV["HEROKU_SLUG_COMMIT"] || ENV["SOURCE_VERSION"] || `git rev-parse HEAD 2> /dev/null`.chomp
end
