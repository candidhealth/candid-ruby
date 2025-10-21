# frozen_string_literal: true

module Candid
  module Commons
    module Types
      class RequestValidationError < Internal::Types::Model
        field :field_name, -> { String }, optional: false, nullable: false
        field :human_readable_message, -> { String }, optional: true, nullable: false

      end
    end
  end
end
