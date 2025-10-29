# frozen_string_literal: true

module Candid
  module Encounters
    module V4
      module Types
        class EpsdtReferralOptional < Internal::Types::Model
          field :condition_indicator_1, lambda {
            Candid::Commons::Types::EpsdtReferralConditionIndicatorCode
          }, optional: true, nullable: false
          field :condition_indicator_2, lambda {
            Candid::Commons::Types::EpsdtReferralConditionIndicatorCode
          }, optional: true, nullable: false
          field :condition_indicator_3, lambda {
            Candid::Commons::Types::EpsdtReferralConditionIndicatorCode
          }, optional: true, nullable: false
        end
      end
    end
  end
end
