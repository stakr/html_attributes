module Stakr # :nodoc:
  module HtmlAttributes # :nodoc:
    
    # Collection of methods building HTML attributes from a hash.
    module Hash
      
      # Returns a string containing the class names whose conditions are neighter <tt>false</tt> nor <tt>nil</tt>,
      # or returns <tt>nil</tt> if no class names remains.
      # 
      # ==== Examples
      # 
      #   { :first => true, :second => false, :third => true }.to_class_attr
      #   # => "first third"
      #   
      #   { :foo => false, :bar => false }.to_class_attr
      #   # => nil
      # 
      def to_class_attr
        self.select { |klass, condition| condition }.           # remove classes with nil or false condition
             map { |elem| elem.first.to_s }.                    # throw condition away
             sort.                                              # sort alphabetically
             to_class_attr                                      # join with ' ' or return nil if empty
      end
      
      # Returns a string containing the rel values whose conditions are neighter <tt>false</tt> nor <tt>nil</tt>,
      # or returns <tt>nil</tt> if no rel values remains.
      # 
      # ==== Examples
      # 
      #   { :nofollow => true, :other => false, :me => true }.to_rel_attr
      #   # => "nofollow me"
      #   
      #   { :foo => false, :bar => false }.to_rel_attr
      #   # => nil
      # 
      def to_rel_attr
        self.select { |klass, condition| condition }.           # remove rel values with nil or false condition
             map { |elem| elem.first.to_s }.                    # throw condition away
             sort.                                              # sort alphabetically
             to_rel_attr                                        # join with ' ' or return nil if empty
      end
      
      # Returns a string containing a style attribute, or returns <tt>nil</tt> if no values remains.
      #
      # ==== Examples
      # 
      #   { :padding => { :top => "8px", :right => "15px" }, :font_size => "12pt" }.to_style_attr
      #   # => "font-size: 12pt; padding-right: 15px; padding-top: 8px;"
      #   
      #   visible = true
      #   { :display => visible ? nil : 'none' }.to_style_attr
      #   # => nil
      #   
      def to_style_attr
        self.flatten { |keys| keys.join('_').gsub('_', '-') }.  # build CSS like key names
             select { |key, value| !value.nil? }.               # remove properties with nil value
             map { |key, value| "#{key}: #{value}" }.           # build property
             sort.                                              # sort alphabetically
             to_style_attr                                      # join with '; ' or return nil if empty
      end
      
      # Returns a new hash flatting the values (recursively), i.e. if a value of <tt>self</tt> is a hash again
      # 1) the keys are build by combining the key of <tt>self</tt> (the one to access that hash value) with the
      # keys of that hash;
      # 2) the values are the values of that hash.
      # 
      # You can either specify a seperator to to build the keys joining them, or a block which gets an array of keys
      # and returns the new key.
      # 
      # ==== Examples
      # 
      #   styles = { :padding => { :top => "8px", :right => "15px" }, :font_size => "12pt" }
      #   
      #   styles.flatten("_")
      #   # => { "padding_top" => "8px", "padding_right" => "15px", "font_size" => "12pt" }
      #   
      #   styles.flatten { |keys| keys.join('-').gsub('_', '-') }
      #   # => { "padding-top" => "8px", "padding-right" => "15px", "font-size" => "12pt" }
      #   
      def flatten(sep = $,, prefix_keys = [], &block) # :nodoc:
        hash = self.class.new
        self.each do |key, value|
          prefix_keys.push(key)
          case value
          when ::Hash
            value.flatten(sep, prefix_keys, &block).each do |k, v|
              hash[k] = v
            end
          else
            hash[block_given? ? yield(prefix_keys) : prefix_keys.join(sep)] = value
          end
          prefix_keys.pop
        end
        hash
      end
      
      # Flattens <tt>self</tt> in place.
      def flatten!(sep = $,, prefix_keys = [], &block) # :nodoc:
        replace(flatten(sep, prefix_keys, &block))
      end
      
    end
    
  end
end
