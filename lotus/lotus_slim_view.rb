require 'slim'
require 'lotus/view'

class LotusSlimView
  include Lotus::View
end

Lotus::View.load!
puts LotusSlimView.render(format: :html)
