
module Candid
  module PreEncounter
    module Images
      module V1
        module Types
          class ImageGetMultiRequest < Internal::Types::Model
            field :patient_id, -> { String }, optional: true, nullable: false
            field :coverage_id, -> { String }, optional: true, nullable: false

          end
        end
      end
    end
  end
end
