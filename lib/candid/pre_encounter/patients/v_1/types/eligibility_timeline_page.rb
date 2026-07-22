# frozen_string_literal: true

module Candid
  module PreEncounter
    module Patients
      module V1
        module Types
          class EligibilityTimelinePage < Internal::Types::Model
            field :items, -> { Internal::Types::Array[Candid::PreEncounter::Patients::V1::Types::EligibilityTimelineEvent] }, optional: false, nullable: false
          end
        end
      end
    end
  end
end
