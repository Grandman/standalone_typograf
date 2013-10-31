# encoding: UTF-8

module StandaloneTypograf #:nodoc:
  module Dashes
    extend ActiveSupport::Concern

    CHAR = {
      :html => '&mdash;',
      :utf  => '—',
    }.freeze

    included do
      register_processor(Processor)
    end

    module Processor
      def self.compile(text, mode)
        text.gsub!(/-(\s)/, CHAR[mode]+'\1')
        return text
      end
    end
  end
end
