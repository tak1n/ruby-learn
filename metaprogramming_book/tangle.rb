module Printable
  def my_print
    print "Printable::print\n"
  end

  def prepare_cover
    print "Prepare Cover\n"
  end
end

module Document
  def print_to_screen
    prepare_cover
	format_for_screen
	my_print
  end

  def format_for_screen
    print "Format for screen\n"
  end

  def my_print
    print "Document::print\n"
  end
end

class Book
  include Document
  include Printable

end

b = Book.new
b.print_to_screen

