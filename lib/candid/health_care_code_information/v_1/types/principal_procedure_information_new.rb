# frozen_string_literal: true

module Candid
  module HealthCareCodeInformation
    module V1
      module Types
        # This correspond to BBR, BR, and CAH code qualifier values.
        class PrincipalProcedureInformationNew < Internal::Types::Model
          field :principal_procedure_code_qualifier, lambda {
            Candid::HealthCareCodeInformation::V1::Types::PrincipalProcedureInformationCodeQualifier
          }, optional: false, nullable: false
          field :principal_procedure_code, -> { String }, optional: false, nullable: false
          field :procedure_date, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
