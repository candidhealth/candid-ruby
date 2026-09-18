# frozen_string_literal: true

module Candid
  module PreEncounter
    module Patients
      module V1
        module Types
          class AuditCoverageCreated < Internal::Types::Model
            field :payer_id, -> { String }, optional: false, nullable: false
            field :payer_name, -> { String }, optional: false, nullable: false
          end
        end
      end
    end
  end
end
