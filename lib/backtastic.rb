require "backtastic/version"
require 'rails-backbone'
require "inflection-js-rails"
require "twitter-bootstrap-rails"
require "active_support/inflections"

module Backtastic
  class BacktasticEngine < Rails::Engine
  end
  
  def self.schema_for(model)
    schema = {}
    model.to_s.constantize.columns.each do |col|
      schema[col.name] = {"type" => col.type }
    end
    schema
  end
end
