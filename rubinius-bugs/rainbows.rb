Rainbows! do
  use :ThreadPool
  worker_connections 2
end

listen 0

preload_app true
