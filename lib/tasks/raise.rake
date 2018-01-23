# Uncommenting this makes the rake:without_env task report an error.
# require 'honeybadger/init/ruby'

namespace :raise do
  task :without_env do
    raise RuntimeError, "This is a test error raised in a Rake task without the Rails environment."
  end

  task :with_env => :environment do
    raise RuntimeError, "This is a test error raised in a Rake task with the Rails environment."
  end
end
