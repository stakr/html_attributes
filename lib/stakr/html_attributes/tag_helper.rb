module Stakr #:nodoc:
  module HtmlAttributes #:nodoc:
    
    module TagHelper #:nodoc:
      
      def self.included(base) #:nodoc:
        base.alias_method_chain :tag_options, :html_attributes
      end
      
      def tag_options_with_html_attributes(options, escape = true) #:nodoc:
        options = ::Hash[*options.map { |key, value| [key, value.improve("to_#{key}_attr")] }.flatten] unless options.blank?
        tag_options_without_html_attributes(options, escape)
      end
      
    end
    
  end
end
