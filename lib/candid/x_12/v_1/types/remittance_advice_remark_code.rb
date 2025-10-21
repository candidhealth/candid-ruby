# frozen_string_literal: true

module Candid
  module X12
    module V1
      module Types
        class RemittanceAdviceRemarkCode < Internal::Types::Model
          field :reason_code, -> { Candid::X12::V1::Types::Rarc }, optional: false, nullable: false

        end
      end
    end
  end
end
