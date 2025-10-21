
module Candid
  module PreEncounter
    module EligibilityChecks
      module V1
        module Types
          class PayerSearchRequest < Internal::Types::Model
            field :page_size, -> { Integer }, optional: true, nullable: false
            field :page_token, -> { String }, optional: true, nullable: false
            field :query, -> { String }, optional: true, nullable: false

          end
        end
      end
    end
  end
end
