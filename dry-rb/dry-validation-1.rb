require "dry/validation"

class NewUserContract < Dry::Validation::Contract
  schema do
    required(:email).value(:string)
    required(:age).value(:integer)
  end
end

contract = NewUserContract.new
result = contract.call(unexpected: :reality, age: 21)

p result.to_h

