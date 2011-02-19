require 'stakr/html_attributes/array'
require 'stakr/html_attributes/hash'
require 'stakr/html_attributes/numeric'
require 'stakr/html_attributes/object'
require 'stakr/html_attributes/tag_helper'

::Array.class_eval do
  include ::Stakr::HtmlAttributes::Array
end

::Hash.class_eval do
  include ::Stakr::HtmlAttributes::Hash
end

::Numeric.class_eval do
  include ::Stakr::HtmlAttributes::Numeric
end

::Object.class_eval do
  include ::Stakr::HtmlAttributes::Object
end

::ActionView::Helpers::TagHelper.module_eval do
  include ::Stakr::HtmlAttributes::TagHelper
end

::ActionView::Helpers::TagHelper::BOOLEAN_ATTRIBUTES.merge([:selected, :compact, :noresize, :noshade, :ismap, :declare, :defer, :nowrap].map { |a| [a, a.to_s] }.flatten)
