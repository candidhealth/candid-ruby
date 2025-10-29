# frozen_string_literal: true

module Candid
  module PreEncounter
    module Patients
      module V1
        module Types
          module ReferralType
            extend Candid::Internal::Types::Enum

            DIRECTED = "DIRECTED"
            ROTATION = "ROTATION"
            OVERNIGHT = "OVERNIGHT"
          end
        end
      end
    end
  end
end
