# frozen_string_literal: true

module Candid
  module PreEncounter
    module Patients
      module V1
        module Types
          class AuditCoverageUpdated < Internal::Types::Model
            field :edits, -> { Internal::Types::Array[Internal::Types::Hash[String, Object]] }, optional: false, nullable: false
            field :source, -> { Candid::PreEncounter::Patients::V1::Types::CoverageUpdateSource }, optional: false, nullable: false
            field :check_id, -> { String }, optional: true, nullable: false
            field :initiator_user_id, -> { String }, optional: true, nullable: false
          end
        end
      end
    end
  end
end
