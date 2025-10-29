# frozen_string_literal: true

module Candid
  module ServiceLines
    module V2
      module Types
        class TestResultOptional < Internal::Types::Model
          field :value, -> { Integer }, optional: true, nullable: false
          field :result_type, -> { Candid::ServiceLines::V2::Types::TestResultType }, optional: true, nullable: false
        end
      end
    end
  end
end
