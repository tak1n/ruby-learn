class RootController
  def show
    body = "<html><body><h1>Hello World</h1></body></html>"
    headers = {"Content-Length" => body.length.to_s, "Content-Type" => "text/html"}
    [200, headers, [body]]
  end
end
