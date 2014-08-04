class BaseController
  def render(path, controller_binding, nested = false)
    erb_file = File.open(path)

    erb = ""
    erb_file.each_line do |line|
      erb << line
    end

    body = ERB.new(erb).result(controller_binding)

    unless nested
      header = {"Content-Type" => "text/html"}

      [200, header, [body]]
    end
  end

  def render_with_layout(path, controller_binding)
    layout_file = File.open("#{App.root}/views/layout.html.erb")

    erb = ""
    layout_file.each_line do |line|
      erb << line
    end

    body = ERB.new(erb).result(controller_binding) do
      render(path, controller_binding, true)
    end

    header = {"Content-Type" => "text/html"}

    [200, header, [body]]
  end
end
