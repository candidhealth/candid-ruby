# frozen_string_literal: true

module Candid
  module PreEncounter
    module Appointments
      module V1
        module Types
          class CountsRequest < Internal::Types::Model
            field :filters, -> { String }, optional: true, nullable: false
          end
        end
      end
    end
  end
end
