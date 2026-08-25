# frozen_string_literal: true

module Candid
  module PreEncounter
    module PatientMerges
      module V1
        module Types
          # The search criteria for fetching patient merge records.
          class PatientMergeSearchRequest < Internal::Types::Model
            field :mrns, -> { Internal::Types::Array[String] }, optional: false, nullable: false
            field :limit, -> { Integer }, optional: true, nullable: false
            field :page_token, -> { String }, optional: true, nullable: false
          end
        end
      end
    end
  end
end
