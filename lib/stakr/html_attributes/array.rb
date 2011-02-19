module Stakr # :nodoc:
  module HtmlAttributes # :nodoc:
    
    # Collection of methods building HTML attributes from an array.
    module Array
      
      # Returns a string representing the value of a HTML class attribute or nil (if empty).
      # 
      # ==== Examples
      # 
      #   ["post", "comment", "spam"].to_class_attr
      #   # => "post comment spam"
      #   
      #   [].to_class_attr
      #   # => nil
      # 
      def to_class_attr
        empty? ? nil : join(' ')
      end
      
      # Returns a string representing the value of a HTML rel attribute or nil (if empty).
      # 
      # ==== Examples
      # 
      #   ["nofollow", "me"].to_rel_attr
      #   # => "nofollow me"
      #   
      #   [].to_class_attr
      #   # => nil
      # 
      def to_rel_attr
        empty? ? nil : join(' ')
      end
      
      # Returns a string representing the value of a HTML style attribute or nil (if empty).
      #
      # ==== Examples
      # 
      #   ["padding-top: 8px", "padding-right: 15px", "font-size: 12pt"].to_style_attr
      #   # => "padding-top: 8px; padding-right: 15px; font-size: 12pt;"
      #   
      #   [].to_style_attr
      #   # => nil
      #   
      def to_style_attr
        empty? ? nil : join('; ').concat(';')
      end
      
    end
    
  end
end
