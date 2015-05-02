require_relative 'workers/hard_worker'

HardWorker.perform_async('test')
