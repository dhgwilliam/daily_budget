TransactionRecord = 
  Functional::Record.new(date: Date, payee: String, category: Symbol, memo: String, total: :Number) do
  mandatory :total, :category
  default :payee, 'N/A'
  default :date, Time.now.to_date
  default :memo, ''
end

class Credit < TransactionRecord
end

class Debit < TransactionRecord
end
