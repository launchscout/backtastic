require "backtastic/version"
require 'rails-backbone'
require "inflection-js-rails"
require "twitter-bootstrap-rails"

module Backtastic
  class BacktasticEngine < Rails::Engine
  end
  
  def self.schema_for(model)
  end
end
