# frozen_string_literal: true

module Candid
  module Eligibility
    module V2
      module Types
        class FindAvailityEligibilityResultsRequest < Internal::Types::Model
          field :member_id, -> { String }, optional: false, nullable: false
          field :payer_id, -> { String }, optional: false, nullable: false
          field :date_of_service, -> { String }, optional: false, nullable: false
          field :provider_npi, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
