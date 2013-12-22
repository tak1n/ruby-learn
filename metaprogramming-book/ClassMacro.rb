class Book
  def title
    puts "title"
  end

  def subtitle
    puts "subtitle"
  end

  def self.deprecate(old_method, new_method)
    define_method(old_method) do |*args, &block|
      warn "Warning: #{old_method}() is deprecated. Use #{new_method}()."
      send(new_method, *args, &block)
    end
  end

  deprecate :GetTitle, :title
  deprecate :title2, :subtitle
end

b = Book.new
b.title2