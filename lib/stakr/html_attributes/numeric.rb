module Stakr # :nodoc:
  module HtmlAttributes # :nodoc:
    
    # Collection of helper methods for each Numeric
    module Numeric
      
      # Returns <tt>self + "pt"</tt> or <tt>"0"</tt> if <tt>self</tt> is zero.
      def pt
        self == 0 ? "0" : "#{self}pt"
      end
      
      # Returns <tt>self + "pc"</tt> or <tt>"0"</tt> if <tt>self</tt> is zero.
      def pc
        self == 0 ? "0" : "#{self}pc"
      end
      
      # Returns <tt>self + "in"</tt> or <tt>"0"</tt> if <tt>self</tt> is zero.
      def in
        self == 0 ? "0" : "#{self}in"
      end
      
      # Returns <tt>self + "mm"</tt> or <tt>"0"</tt> if <tt>self</tt> is zero.
      def mm
        self == 0 ? "0" : "#{self}mm"
      end
      
      # Returns <tt>self + "cm"</tt> or <tt>"0"</tt> if <tt>self</tt> is zero.
      def cm
        self == 0 ? "0" : "#{self}cm"
      end
      
      # Returns <tt>self + "px"</tt> or <tt>"0"</tt> if <tt>self</tt> is zero.
      def px
        self == 0 ? "0" : "#{self}px"
      end
      
      # Returns <tt>self + "em"</tt> or <tt>"0"</tt> if <tt>self</tt> is zero.
      def em
        self == 0 ? "0" : "#{self}em"
      end
      
      # Returns <tt>self + "ex"</tt> or <tt>"0"</tt> if <tt>self</tt> is zero.
      def ex
        self == 0 ? "0" : "#{self}ex"
      end
      
      # Returns <tt>self + "%"</tt> or <tt>"0"</tt> if <tt>self</tt> is zero.
      def percent
        self == 0 ? "0" : "#{self}%"
      end
      
    end
    
  end
end
