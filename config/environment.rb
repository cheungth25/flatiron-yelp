require 'bundler/setup'
# require_relative "../app/controllers/application_controller.rb"
Bundler.require

ENV['SINATRA_ENV'] ||= "development"

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
)

require_all "app/"

# Dir[File.join(File.dirname(__FILE__), "../app/models", "*.rb")].each {|f| require f}
# Dir[File.join(File.dirname(__FILE__), "../app/controllers", "*.rb")].sort.each {|f| require f}