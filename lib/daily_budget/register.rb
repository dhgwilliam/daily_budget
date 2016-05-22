require 'daily_budget/transaction'

RegisterRecord = 
  Functional::Record.new(transactions: Array) do
    default :transactions, []
  end

class Register < RegisterRecord
  include Functional::PatternMatching

  defn(:with_category, Symbol) do |category|
    transactions.select {|t| t.category == category}
  end

  defn(:<<, _) do |t|
    transactions << t
  end.when{|t| Functional::Protocol::Satisfy?(t, :Transaction)}
  defn(:<<, _) {|_| }
end
