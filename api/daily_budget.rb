require 'grape'
require_relative '../lib/daily_budget/month.rb'

module Daily_budget
  class API < Grape::API
    version 'v1', using: :header, vendor: 'daily_budget'
    format :json
    prefix :api

    resource :days do
      desc 'Return days this month'
      get 'left/this/month' do
        Month.days_left
      end

      get 'this/month' do
        Month.days(Month.this_month)
      end
    end

    resource :this do
      get 'month' do
        Month.this_month
      end
    end
  end
end
