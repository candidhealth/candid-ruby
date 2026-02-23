# frozen_string_literal: true

module Candid
  module PreEncounter
    module EligibilityChecks
      module V1
        module Types
          class EligibilityChecksGetMultiRequest < Internal::Types::Model
            field :page_token, -> { String }, optional: true, nullable: false
            field :limit, -> { Integer }, optional: true, nullable: false
            field :subscriber_member_id, -> { String }, optional: true, nullable: false
            field :payer_id, -> { String }, optional: true, nullable: false
            field :provider_npi, -> { String }, optional: true, nullable: false
            field :date_of_service, -> { String }, optional: true, nullable: false
            field :initiated_at_min, -> { String }, optional: true, nullable: false
            field :initiated_at_max, -> { String }, optional: true, nullable: false
          end
        end
      end
    end
  end
end
