# frozen_string_literal: true

module Candid
  module Encounters
    module V4
      module Types
        class Vitals < Internal::Types::Model
          field :height_in, -> { Integer }, optional: true, nullable: false
          field :weight_lbs, -> { Integer }, optional: true, nullable: false
          field :blood_pressure_systolic_mmhg, -> { Integer }, optional: true, nullable: false
          field :blood_pressure_diastolic_mmhg, -> { Integer }, optional: true, nullable: false
          field :body_temperature_f, -> { Integer }, optional: true, nullable: false
          field :hemoglobin_gdl, -> { Integer }, optional: true, nullable: false
          field :hematocrit_pct, -> { Integer }, optional: true, nullable: false

        end
      end
    end
  end
end
