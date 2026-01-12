# frozen_string_literal: true

module Candid
  module ServiceLines
    module V2
      module Types
        class UniversalServiceLineCreateStandalone < Internal::Types::Model
          field :diagnosis_id_zero, -> { String }, optional: true, nullable: false
          field :diagnosis_id_one, -> { String }, optional: true, nullable: false
          field :diagnosis_id_two, -> { String }, optional: true, nullable: false
          field :diagnosis_id_three, -> { String }, optional: true, nullable: false
          field :revenue_code, -> { String }, optional: true, nullable: false
          field :procedure_code, -> { String }, optional: true, nullable: false
          field :prior_authorization_number, -> { String }, optional: true, nullable: false
          field :external_id, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
