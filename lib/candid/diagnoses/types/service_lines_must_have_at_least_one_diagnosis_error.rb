# frozen_string_literal: true

module Candid
  module Diagnoses
    module Types
      class ServiceLinesMustHaveAtLeastOneDiagnosisError < Internal::Types::Model
        field :diagnosis_id, -> { String }, optional: false, nullable: false
        field :service_line_id, -> { String }, optional: false, nullable: false
        field :message, -> { String }, optional: false, nullable: false
      end
    end
  end
end
