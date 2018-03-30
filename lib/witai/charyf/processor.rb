require 'charyf' # TODO require 'charyf/engine/intent/processors/processor'

require 'wit'

module WitAI
  module Charyf
    class Processor < ::Charyf::Engine::Intent::Processor::Base

      class NoKeyProvided < StandardError; end

      strategy_name :wit

      def self.get_for(skill = nil)
        return self.new
      end

      def initialize
        raise NoKeyProvided.new('WitAI::Charyf.api_key has not been set') if !WitAI::Charyf.api_key || WitAI::Charyf.api_key.empty?
      end

      def determine(request)
        text = request.text

        client = Wit.new(access_token: WitAI::Charyf.api_key)

        res = client.message(text, 1)

        if (entities = res["entities"]) && res["entities"]["intent"] && res["entities"]["intent"].size > 0
          intent = entities.delete("intent").first

          if intent["value"].empty?
            return unknown
          end

          intent_name = intent["value"]
          confidence = intent["confidence"]

          matches = {}
          entities.keys.each do |entity_name|
            matches[entity_name] = entities[entity_name].map { |match| match.select { |k,v| ["value", "grain"].include? k } }
          end

          return ::Charyf::Engine::Intent.new(intent_name, confidence, matches)
        end

        unknown
      rescue Wit::Error => error
        Charyf.error_handlers.handle_exception(error)

        return unknown
      end

    end
  end
end