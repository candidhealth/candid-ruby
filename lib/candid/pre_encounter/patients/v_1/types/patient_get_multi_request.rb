
module Candid
  module PreEncounter
    module Patients
      module V1
        module Types
          class PatientGetMultiRequest < Internal::Types::Model
            field :mrn, -> { String }, optional: true, nullable: false
            field :similar_name_ordering, -> { String }, optional: true, nullable: false

          end
        end
      end
    end
  end
end
