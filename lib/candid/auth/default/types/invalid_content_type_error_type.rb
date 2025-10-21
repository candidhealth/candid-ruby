# frozen_string_literal: true

module Candid
  module Auth
    module Default
      module Types
        class InvalidContentTypeErrorType < Internal::Types::Model
          field :message, -> { String }, optional: false, nullable: false

        end
      end
    end
  end
end
