# frozen_string_literal: true

module Candid
  module ServiceLines
    module V2
      module Types
        class DrugIdentification < Internal::Types::Model
          field :service_id_qualifier, -> { Candid::ServiceLines::V2::Types::ServiceIdQualifier }, optional: false, nullable: false
          field :national_drug_code, -> { String }, optional: false, nullable: false
          field :national_drug_unit_count, -> { String }, optional: false, nullable: false
          field :measurement_unit_code, -> { Candid::ServiceLines::V2::Types::MeasurementUnitCode }, optional: false, nullable: false
          field :link_sequence_number, -> { String }, optional: true, nullable: false
          field :pharmacy_prescription_number, -> { String }, optional: true, nullable: false
          field :conversion_formula, -> { String }, optional: true, nullable: false
          field :drug_description, -> { String }, optional: true, nullable: false

        end
      end
    end
  end
end
