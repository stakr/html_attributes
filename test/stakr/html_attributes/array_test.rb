require 'test/unit'
require 'rubygems'
require 'active_support'

require File.dirname(__FILE__) + '/../../../lib/stakr/html_attributes/array'

class ::Array #:nodoc:
  include Stakr::HtmlAttributes::Array
end

module Stakr # :nodoc:
  module HtmlAttributes # :nodoc:
    class ArrayTest < Test::Unit::TestCase
      
      def test_empty_to_class_attr
        classes = []
        assert_nil classes.to_class_attr
      end
      
      def test_to_class_attr
        classes = ["first", "second", "third"]
        result = "first second third"
        assert_equal result, classes.to_class_attr
      end
      
      def test_empty_to_style_attr
        styles = []
        assert_nil styles.to_style_attr
      end
      
      def test_to_style_attr
        styles = ["padding-top: 8px", "padding-right: 15px", "font-size: 12pt"]
        result = "padding-top: 8px; padding-right: 15px; font-size: 12pt;"
        assert_equal result, styles.to_style_attr
      end
      
    end
  end
end
