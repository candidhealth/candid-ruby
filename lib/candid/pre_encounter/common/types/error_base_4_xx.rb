# frozen_string_literal: true

module Candid
  module PreEncounter
    module Common
      module Types
        class ErrorBase4Xx < Internal::Types::Model
          field :message, -> { String }, optional: false, nullable: false
          field :data, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
        end
      end
    end
  end
end
