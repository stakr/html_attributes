module Stakr # :nodoc:
  module HtmlAttributes # :nodoc:
    
    # Collection of helper methods for each Object
    module Object # :nodoc:
      
      # Returns the result of the specified method if <tt>self</tt> responds to that method,
      # otherwise <tt>self</tt> is returned.
      def improve(method, &block)
        respond_to?(method) ? send(method, &block) : self
      end
      
    end
    
  end
end
