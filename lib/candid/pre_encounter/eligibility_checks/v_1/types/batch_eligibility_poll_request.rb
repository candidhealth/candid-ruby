
module Candid
  module PreEncounter
    module EligibilityChecks
      module V1
        module Types
          class BatchEligibilityPollRequest < Internal::Types::Model
            field :batch_id, -> { String }, optional: false, nullable: false
            field :page_token, -> { String }, optional: true, nullable: false

          end
        end
      end
    end
  end
end
