# frozen_string_literal: true

module Candid
  module Diagnoses
    module Types
      class DiagnosisCreate < Internal::Types::Model
        field :name, -> { String }, optional: true, nullable: false
        field :code_type, -> { Candid::Diagnoses::Types::DiagnosisTypeCode }, optional: false, nullable: false
        field :code, -> { String }, optional: false, nullable: false
        field :present_on_admission_indicator, lambda {
          Candid::YesNoIndicator::Types::YesNoIndicator
        }, optional: true, nullable: false
      end
    end
  end
end
