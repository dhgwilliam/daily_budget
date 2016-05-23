require 'rack'
require_relative './api/daily_budget.rb'

run Daily_budget::API
