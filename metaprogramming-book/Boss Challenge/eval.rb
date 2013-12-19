
  def add_checked_attribute(klass, attribute)
  	eval "
  	  class #{klass}
  	    def #{attribute}
  	      @#{attribute}
  		end

  		def #{attribute}=(value)
  		  raise 'Invalid attribute' unless value
  		  @#{attribute} = value
  		end
      end
  	"
  end
