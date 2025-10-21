# frozen_string_literal: true

module Candid
  module PreEncounter
    module EligibilityChecks
      module V1
        module Types
          # An object representing the payload for a Medicare Advantage recommendation.
          class MedicareAdvantageRecommendationPayload < Internal::Types::Model
            field :ma_benefit, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
            field :payer_id, -> { String }, optional: true, nullable: false
            field :payer_name, -> { String }, optional: true, nullable: false
            field :member_id, -> { String }, optional: true, nullable: false

          end
        end
      end
    end
  end
end
