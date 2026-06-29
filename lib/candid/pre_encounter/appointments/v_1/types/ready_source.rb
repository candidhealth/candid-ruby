# frozen_string_literal: true

module Candid
  module PreEncounter
    module Appointments
      module V1
        module Types
          module ReadySource
            extend Candid::Internal::Types::Enum

            MANUAL = "MANUAL"
            MACHINE = "MACHINE"
          end
        end
      end
    end
  end
end
