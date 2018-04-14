require 'charyf/utils/generator/base'

module WitAI
  module Charyf
    module Generators
      class InstallGenerator < ::Charyf::Generators::Base

        source_root File.expand_path('templates', __dir__)

        namespace 'witai:install'

        def initializer
          template 'config/initializers/wit.rb.tt'
        end

        def finalize
          return unless behavior == :invoke

          say_status 'notice', "Wit installed" +
              "\n\t\tDo not forget to set adapt intent processor in application configuration" +
              "\n\t\t\tconfig.enabled_intent_processors = [.., :wit, ..]", :green
        end

      end
    end
  end
end