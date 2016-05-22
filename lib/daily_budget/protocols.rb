Functional::SpecifyProtocol(:Number) do
  instance_method :-
  instance_method :+
  instance_method :>
  instance_method :<
end

Functional::SpecifyProtocol(:Transaction) do
  attr_reader :date
  attr_reader :payee
  attr_reader :category
  attr_reader :memo
  attr_reader :total
end
