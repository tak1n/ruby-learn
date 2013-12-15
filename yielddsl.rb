class Recipe
  attr_accessor :name, :ingredients, :instructions

  def initialize(name)
    self.name = name
    self.ingredients = []
    self.instructions = []

    yield self
  end

  def ingredient(name, options = {})
    ingredient = name
    ingredient << " (#{options[:amount]})" if options[:amount]

    ingredients << ingredient
  end

  def step(text, options = {})
    instruction = text
    instruction << " (#{options[:for]})" if options[:for]

    instructions << instruction
  end

  def to_s
    output = name
    output << "\n#{'=' * name.size}\n\n"
    output << "Ingredients: #{ingredients.join(', ')}\n\n"

    instructions.each_with_index do |instruction, index|
      output << "#{index + 1}) #{instruction}\n"
    end

    output
  end
end

mac_and_cheese = Recipe.new("Mac and Cheese") do |r|
  r.ingredient "Water", :amount => "2 cups"
  r.ingredient "Noodles", :amount => "1 cup"
  r.ingredient "Cheese", :amount => "1/2 cup"

  r.step "Heat water to boiling.", :for => "5 minutes"
  r.step "Add noodles to boiling water.", :for => "6 minutes"
  r.step "Drain water."
  r.step "Mix cheese in with noodles."
end

puts mac_and_cheese