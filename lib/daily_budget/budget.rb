BudgetRecord =
  Functional::Record.new(name: Symbol, total: :Number) do
    mandatory :name, :total
  end

class Budget < BudgetRecord
  include Functional::PatternMatching

  defn(:remaining, Register) do |register|
    register.with_category(name)
      .reduce(total) do |a, e|
        if e.is_a?(Credit)
          a + e.total
        elsif e.is_a?(Debit)
          a - e.total
        end
      end.round(2)
  end

  defn(:remaining_per_day, Register) do |register|
    (remaining(register).to_f / Month.days_left).round(2)
  end
end
