# frozen_string_literal: true

module Candid
  module HealthCareCodeInformation
    module V1
      module Types
        class HealthCareCodeInformation < Internal::Types::Model
          field :id, -> { String }, optional: true, nullable: false
          field :encounter_id, -> { String }, optional: true, nullable: false

        end
      end
    end
  end
end
