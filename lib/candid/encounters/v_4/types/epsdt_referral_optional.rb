# frozen_string_literal: true

module Candid
  module Encounters
    module V4
      module Types
        class EpsdtReferralOptional < Internal::Types::Model
          field :condition_indicator_1, -> { Candid::Commons::Types::EpsdtReferralConditionIndicatorCode }, optional: true, nullable: false, api_name: "condition_indicator1"
          field :condition_indicator_2, -> { Candid::Commons::Types::EpsdtReferralConditionIndicatorCode }, optional: true, nullable: false, api_name: "condition_indicator2"
          field :condition_indicator_3, -> { Candid::Commons::Types::EpsdtReferralConditionIndicatorCode }, optional: true, nullable: false, api_name: "condition_indicator3"
        end
      end
    end
  end
end
