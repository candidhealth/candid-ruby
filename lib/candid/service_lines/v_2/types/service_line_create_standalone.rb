# frozen_string_literal: true

module Candid
  module ServiceLines
    module V2
      module Types
        class ServiceLineCreateStandalone < Internal::Types::Model
          field :diagnosis_id_zero, -> { String }, optional: true, nullable: false
          field :diagnosis_id_one, -> { String }, optional: true, nullable: false
          field :diagnosis_id_two, -> { String }, optional: true, nullable: false
          field :diagnosis_id_three, -> { String }, optional: true, nullable: false

        end
      end
    end
  end
end
