# frozen_string_literal: true

module Candid
  module HealthCareCodeInformation
    module V1
      module Types
        # This corresponds to the BBQ or BQ code qualifier values.
        class OtherProcedureInformationNew < Internal::Types::Model
          field :other_procedure_code_qualifier, lambda {
            Candid::HealthCareCodeInformation::V1::Types::OtherProcedureInformationCodeQualifier
          }, optional: false, nullable: false
          field :other_procedure_code, -> { String }, optional: false, nullable: false
          field :other_procedure_date, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
