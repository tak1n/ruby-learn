require 'controller/base_controller'

class RootController < BaseController
  def show
    @test = "test2"

    render("#{App.root}/views/root/show.html.erb", binding)
  end
end
