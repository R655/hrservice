class ApplicationController < ActionController::Base
  protect_from_forgery
   ActiveScaffold.set_defaults do |config|
    config.theme = :blue   #fill in configuration option here
  end 
end
