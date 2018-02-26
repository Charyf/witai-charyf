require 'charyf' # TODO require 'charyf/utils/extension'

require_relative 'charyf/version'
require_relative 'charyf/processor'

module WitAI
  module Charyf
    class Extension < ::Charyf::Extension

    end

    extend self

    def api_key
      @api_key
    end

    def api_key=(key)
      @api_key = key
    end

  end
end
