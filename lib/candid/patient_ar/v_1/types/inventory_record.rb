# frozen_string_literal: true

module Candid
  module PatientAr
    module V1
      module Types
        class InventoryRecord < Internal::Types::Model
          field :claim_id, -> { String }, optional: false, nullable: false
          field :encounter_id, -> { String }, optional: false, nullable: false
          field :timestamp, -> { String }, optional: false, nullable: false
          field :patient_external_id, -> { String }, optional: false, nullable: false
          field :patient_ar_status, lambda {
            Candid::PatientAr::V1::Types::PatientArStatus
          }, optional: false, nullable: false
        end
      end
    end
  end
end
