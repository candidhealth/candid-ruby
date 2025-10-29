# frozen_string_literal: true

module Candid
  module Financials
    module Types
      class ServiceLineAllocationTarget < Internal::Types::Model
        field :service_line_id, -> { String }, optional: false, nullable: false
        field :claim_id, -> { String }, optional: false, nullable: false
        field :encounter_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
