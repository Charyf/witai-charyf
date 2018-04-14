require 'charyf' # TODO require 'charyf/utils/extension'

require_relative 'charyf/version'
require_relative 'charyf/processor'

module WitAI
  module Charyf
    class Extension < ::Charyf::Extension

      generators do
        require_relative 'charyf/generators/install/install_generator'
      end

      config.api_key = nil

    end

    def self.api_key
      Extension.config.api_key
    end

  end
end
