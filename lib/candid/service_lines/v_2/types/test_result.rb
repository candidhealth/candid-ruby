# frozen_string_literal: true

module Candid
  module ServiceLines
    module V2
      module Types
        class TestResult < Internal::Types::Model
          field :value, -> { Integer }, optional: false, nullable: false
          field :result_type, -> { Candid::ServiceLines::V2::Types::TestResultType }, optional: false, nullable: false
        end
      end
    end
  end
end
