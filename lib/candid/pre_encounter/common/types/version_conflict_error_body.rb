# frozen_string_literal: true

module Candid
  module PreEncounter
    module Common
      module Types
        class VersionConflictErrorBody < Internal::Types::Model
          field :latest_version, -> { Integer }, optional: true, nullable: false
        end
      end
    end
  end
end
