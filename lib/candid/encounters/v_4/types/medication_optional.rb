# frozen_string_literal: true

module Candid
  module Encounters
    module V4
      module Types
        class MedicationOptional < Internal::Types::Model
          field :name, -> { String }, optional: true, nullable: false
          field :rx_cui, -> { String }, optional: true, nullable: false
          field :dosage, -> { String }, optional: true, nullable: false
          field :dosage_form, -> { String }, optional: true, nullable: false
          field :frequency, -> { String }, optional: true, nullable: false
          field :as_needed, -> { Internal::Types::Boolean }, optional: true, nullable: false

        end
      end
    end
  end
end
