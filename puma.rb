environment 'production'

threads 16, 16
workers 4

preload_app!

# bind 'unix:///tmp/sockets/monitr.sock'
# daemonize
# pidfile 'tmp/puma.pid'
# stdout_redirect 'log/puma_stdout.log', 'log/puma_stderr.log', true
#
# on_worker_boot do
#   ActiveSupport.on_load(:active_record) do
#     ActiveRecord::Base.establish_connection
#   end
# end
