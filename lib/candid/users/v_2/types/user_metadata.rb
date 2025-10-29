# frozen_string_literal: true

module Candid
  module Users
    module V2
      module Types
        class UserMetadata < Internal::Types::Model
          extend Candid::Internal::Types::Union

          discriminant :type

          member -> { Candid::Users::V2::Types::MachineUserMetadata }, key: "MACHINE_USER_METADATA"
          member -> { Candid::Users::V2::Types::HumanUserMetadata }, key: "HUMAN_USER_METADATA"
        end
      end
    end
  end
end
