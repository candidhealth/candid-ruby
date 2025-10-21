# frozen_string_literal: true

module Candid
  module ClinicalTrials
    module V1
      module Types
        class ClinicalTrial < Internal::Types::Model
          field :clinical_trial_id, -> { String }, optional: false, nullable: false
          field :non_insurance_payer_id, -> { String }, optional: false, nullable: false
          field :is_active, -> { Internal::Types::Boolean }, optional: false, nullable: false

        end
      end
    end
  end
end
