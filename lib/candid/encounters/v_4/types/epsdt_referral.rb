# frozen_string_literal: true

module Candid
  module Encounters
    module V4
      module Types
        class EpsdtReferral < Internal::Types::Model
          field :condition_indicator_1, -> { Candid::Commons::Types::EpsdtReferralConditionIndicatorCode }, optional: false, nullable: false
          field :condition_indicator_2, -> { Candid::Commons::Types::EpsdtReferralConditionIndicatorCode }, optional: true, nullable: false
          field :condition_indicator_3, -> { Candid::Commons::Types::EpsdtReferralConditionIndicatorCode }, optional: true, nullable: false

        end
      end
    end
  end
end
