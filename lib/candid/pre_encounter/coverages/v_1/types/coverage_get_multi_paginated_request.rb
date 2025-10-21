
module Candid
  module PreEncounter
    module Coverages
      module V1
        module Types
          class CoverageGetMultiPaginatedRequest < Internal::Types::Model
            field :patient_id, -> { String }, optional: true, nullable: false
            field :payer_plan_group_id, -> { String }, optional: true, nullable: false
            field :page_token, -> { String }, optional: true, nullable: false
            field :limit, -> { Integer }, optional: true, nullable: false

          end
        end
      end
    end
  end
end
