# frozen_string_literal: true

module Candid
  module PreEncounter
    module Patients
      module V1
        module Types
          # Information about the upstream system that owns this patient data.
          class ExternalProvenance < Internal::Types::Model
            field :external_id, -> { String }, optional: false, nullable: false
            field :system_name, -> { String }, optional: false, nullable: false

          end
        end
      end
    end
  end
end
