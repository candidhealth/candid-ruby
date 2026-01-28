# frozen_string_literal: true

module Candid
  module PreEncounter
    module Patients
      module V1
        module Types
          class GetCoverageSnapshotRequest < Internal::Types::Model
            field :id, -> { String }, optional: false, nullable: false
            field :date, -> { String }, optional: true, nullable: false
          end
        end
      end
    end
  end
end
