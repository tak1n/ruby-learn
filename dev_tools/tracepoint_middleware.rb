class TracePoint
  class Middleware
    def initialize(app)
      @app = app
    end

    def call(env)
      stats = {}
      trace = TracePoint.new(:call) do |tp|
        stats[tp.defined_class] ||= {}
        stats[tp.defined_class][tp.method_id] ||= 0
        stats[tp.defined_class][tp.method_id] += 1
      end
      trace.enable
      response = @app.call(env)
      trace.disable

      puts env['PATH_INFO']
      puts "#{stats.keys.size} classes used"
      puts "#{stats.map{|k,v| v.keys}.flatten.size} methods used"
      puts "#{stats.map{|k,v| v.values}.flatten} methods dispatched"
      # File.open("tmp/#{env['PATH_INFO'].gsub('/', '_')}_req_stats.json", "w"){|f| f << stats.to_json }
      puts ""
      response
    end
  end
end
