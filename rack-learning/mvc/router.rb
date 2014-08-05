Dir["controller/*.rb"].each { |file| require file }

module Router
  extend self

  def route(path)
    return RootController.new.show if path == "/"

    path_array = path.split("/")
    controller_name = path_array[1].capitalize + "Controller"
    action_name = path_array[2]

    controller = get_controller(controller_name)
    return controller if controller.class == Array

    execute_controller_action(controller, action_name.to_sym)
  end

private

  def get_controller(controller_name)
    Kernel.const_get(controller_name)
  rescue NameError
    [404, {"Content-Type" => "text/html"}, ["Controller not found"]]
  end

  def execute_controller_action(controller, action)
    cobject = controller.new

    if cobject.respond_to?(action)
      cobject.send(action)
    else
      [404, {"Content-Type" => "text/html"}, ["Action not found"]]
    end
  end
end
