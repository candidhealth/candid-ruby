# frozen_string_literal: true

module Candid
  module Diagnoses
    module Types
      class DiagnosisUpdate < Internal::Types::Model
        field :diagnosis_id, -> { String }, optional: false, nullable: false
        field :name, -> { String }, optional: true, nullable: false
        field :code_type, -> { Candid::Diagnoses::Types::DiagnosisTypeCode }, optional: true, nullable: false
        field :code, -> { String }, optional: true, nullable: false
        field :present_on_admission_indicator, lambda {
          Candid::YesNoIndicator::Types::YesNoIndicator
        }, optional: true, nullable: false
      end
    end
  end
end
