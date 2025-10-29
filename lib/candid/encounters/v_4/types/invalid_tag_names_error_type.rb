# frozen_string_literal: true

module Candid
  module Encounters
    module V4
      module Types
        class InvalidTagNamesErrorType < Internal::Types::Model
          field :invalid_tag_names, -> { Internal::Types::Array[String] }, optional: false, nullable: false
        end
      end
    end
  end
end
