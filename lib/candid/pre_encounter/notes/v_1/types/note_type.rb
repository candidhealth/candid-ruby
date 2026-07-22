# frozen_string_literal: true

module Candid
  module PreEncounter
    module Notes
      module V1
        module Types
          module NoteType
            extend Candid::Internal::Types::Enum

            GENERAL = "GENERAL"
            ELIGIBILITY = "ELIGIBILITY"
          end
        end
      end
    end
  end
end
