# frozen_string_literal: true

module Candid
  module PreEncounter
    module PatientMerges
      module V1
        module Types
          # Patient has other patients merged into them.
          class PrimaryStatus < Internal::Types::Model
            field :alternative_mrns, -> { Internal::Types::Array[String] }, optional: false, nullable: false
          end
        end
      end
    end
  end
end
