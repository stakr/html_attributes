require 'test/unit'
require 'rubygems'
require 'active_support'

require File.dirname(__FILE__) + '/../../../lib/stakr/html_attributes/numeric'

class ::Numeric #:nodoc:
  include Stakr::HtmlAttributes::Numeric
end

module Stakr # :nodoc:
  module HtmlAttributes # :nodoc:
    class NumberTest < Test::Unit::TestCase
      
      def test_zero
        assert_equal "0", 0.px
      end
      
      def test_pt
        assert_equal "12pt", 12.pt
      end
      
      def test_pc
        assert_equal "12pc", 12.pc
      end
      
      def test_in
        assert_equal "12in", 12.in
      end
      
      def test_mm
        assert_equal "12mm", 12.mm
      end
      
      def test_cm
        assert_equal "12cm", 12.cm
      end
      
      def test_pixel
        assert_equal "12px", 12.px
      end
      
      def test_em
        assert_equal "12em", 12.em
      end
      
      def test_ex
        assert_equal "12ex", 12.ex
      end
      
      def test_percent
        assert_equal "12%", 12.percent
      end
      
    end
  end
end
