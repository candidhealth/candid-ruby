# frozen_string_literal: true

module Candid
  module ServiceLines
    module V2
      module Types
        class ServiceLineAdjustment < Internal::Types::Model
          field :created_at, -> { String }, optional: false, nullable: false
          field :adjustment_group_code, -> { String }, optional: true, nullable: false
          field :adjustment_reason_code, -> { String }, optional: true, nullable: false
          field :adjustment_amount_cents, -> { Integer }, optional: true, nullable: false
          field :adjustment_note, -> { String }, optional: true, nullable: false

        end
      end
    end
  end
end
