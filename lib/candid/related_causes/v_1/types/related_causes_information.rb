# frozen_string_literal: true

module Candid
  module RelatedCauses
    module V1
      module Types
        class RelatedCausesInformation < Internal::Types::Model
          field :related_causes_code_1, lambda {
            Candid::RelatedCauses::V1::Types::RelatedCausesCode
          }, optional: false, nullable: false
          field :related_causes_code_2, lambda {
            Candid::RelatedCauses::V1::Types::RelatedCausesCode
          }, optional: true, nullable: false
          field :state_or_province_code, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
