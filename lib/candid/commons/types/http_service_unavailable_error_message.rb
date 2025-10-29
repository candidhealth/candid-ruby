# frozen_string_literal: true

module Candid
  module Commons
    module Types
      class HttpServiceUnavailableErrorMessage < Internal::Types::Model
        field :message, -> { String }, optional: true, nullable: false
      end
    end
  end
end
