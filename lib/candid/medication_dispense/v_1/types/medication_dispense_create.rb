# frozen_string_literal: true

module Candid
  module MedicationDispense
    module V1
      module Types
        class MedicationDispenseCreate < Internal::Types::Model
          field :medication_dispense_external_id, -> { String }, optional: false, nullable: false
          field :patient_external_id, -> { String }, optional: false, nullable: false
          field :procedure_code, -> { String }, optional: false, nullable: false
          field :quantity, -> { String }, optional: false, nullable: false
          field :units, -> { Candid::Commons::Types::ServiceLineUnits }, optional: false, nullable: false
          field :date_of_service, -> { String }, optional: false, nullable: false
          field :drug_identification, lambda {
            Candid::ServiceLines::V2::Types::DrugIdentification
          }, optional: true, nullable: false
          field :description, -> { String }, optional: true, nullable: false
          field :modifiers, lambda {
            Internal::Types::Array[Candid::Commons::Types::ProcedureModifier]
          }, optional: true, nullable: false
        end
      end
    end
  end
end
