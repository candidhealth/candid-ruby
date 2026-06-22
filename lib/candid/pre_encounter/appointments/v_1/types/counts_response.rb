# frozen_string_literal: true

module Candid
  module PreEncounter
    module Appointments
      module V1
        module Types
          class CountsResponse < Internal::Types::Model
            field :not_ready_reason_counts, -> { Internal::Types::Hash[Candid::PreEncounter::Appointments::V1::Types::NotReadyReason, Integer] }, optional: true, nullable: false
          end
        end
      end
    end
  end
end
