require 'test/unit'
require 'rubygems'
require 'active_support'

require File.dirname(__FILE__) + '/../../../lib/stakr/html_attributes/array'
require File.dirname(__FILE__) + '/../../../lib/stakr/html_attributes/hash'
require File.dirname(__FILE__) + '/../../../lib/stakr/html_attributes/numeric'

class ::Array #:nodoc:
  include Stakr::HtmlAttributes::Array
end

class ::Hash #:nodoc:
  include Stakr::HtmlAttributes::Hash
end

class ::Numeric #:nodoc:
  include Stakr::HtmlAttributes::Numeric
end

module Stakr # :nodoc:
  module HtmlAttributes # :nodoc:
    class HashTest < Test::Unit::TestCase
      
      def test_empty_to_class_attr
        classes = { :foo => false, :bar => false }
        assert_nil classes.to_class_attr
      end
      
      def test_to_class_attr
        classes = { :first => true, :second => false, :third => true }
        result = "first third"
        assert_equal result, classes.to_class_attr
      end
      
      def test_empty_to_style_attr
        visible_condition = true
        styles = { :display => visible_condition ? nil : 'none' }
        assert_nil styles.to_style_attr
      end
      
      def test_to_style_attr
        styles = { :padding => { :top => 8.px, :right => 15.px }, :font_size => 12.pt }
        result = "font-size: 12pt; padding-right: 15px; padding-top: 8px;"
        assert_equal result, styles.to_style_attr
      end
      
      # Hash#flatten
      
      def test_empty_flatten
        styles = { }
        result = { }
        assert_equal result, styles.flatten('_')
      end
      
      def test_flatt_flatten
        styles = { :padding => "8px 0 0 15px", :font_size => "12pt" }
        result = { "padding" => "8px 0 0 15px", "font_size" => "12pt" }
        assert_equal result, styles.flatten('_')
      end
      
      def test_flatten_with_seperator
        styles = { :padding => { :top => "8px", :right => "15px" }, :font_size => "12pt" }
        result = { "padding_top" => "8px", "padding_right" => "15px", "font_size" => "12pt" }
        assert_equal result, styles.flatten('_')
      end
      
      def test_flatten_with_seperator_and_indifferent_access
        styles = { :padding => { :top => "8px", :right => "15px" }, :font_size => "12pt" }.with_indifferent_access
        result = { "padding_top" => "8px", "padding_right" => "15px", "font_size" => "12pt" }.with_indifferent_access
        assert_equal result, styles.flatten('_')
      end
      
      def test_flatten_with_block
        styles = { :padding => { :top => "8px", :right => "15px" }, :font_size => "12pt" }
        result = { "padding-top" => "8px", "padding-right" => "15px", "font-size" => "12pt" }
        assert_equal result, styles.flatten { |keys| keys.join('-').gsub('_', '-') }
      end
      
      def test_flatten_with_block_and_indifferent_access
        styles = { :padding => { :top => "8px", :right => "15px" }, :font_size => "12pt" }.with_indifferent_access
        result = { "padding-top" => "8px", "padding-right" => "15px", "font-size" => "12pt" }.with_indifferent_access
        assert_equal result, styles.flatten { |keys| keys.join('-').gsub('_', '-') }
      end
      
    end
  end
end
