# encoding: UTF-8

module StandaloneTypograf #:nodoc:
  module Ellipsis
    extend ActiveSupport::Concern

    CHAR = {
        :html => '&hellip;',
        :utf  => '…',
    }.freeze

    included do
      register_processor(Processor)
    end

    module Processor
      def self.compile(text, mode)
        text.gsub!(/([[:alpha:]])([.][.][.])(\s|$)/, '\1'+CHAR[mode]+'\3')
        return text
      end
    end
  end
end