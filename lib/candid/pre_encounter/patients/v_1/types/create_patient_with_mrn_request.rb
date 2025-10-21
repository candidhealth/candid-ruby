
module Candid
  module PreEncounter
    module Patients
      module V1
        module Types
          class CreatePatientWithMrnRequest < Internal::Types::Model
            field :skip_duplicate_check, -> { Internal::Types::Boolean }, optional: true, nullable: false
            field :body, -> { Candid::PreEncounter::Patients::V1::Types::MutablePatientWithMrn }, optional: false, nullable: false

          end
        end
      end
    end
  end
end
