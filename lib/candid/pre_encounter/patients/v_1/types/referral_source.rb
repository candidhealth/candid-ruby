# frozen_string_literal: true

module Candid
  module PreEncounter
    module Patients
      module V1
        module Types
          module ReferralSource
            extend Candid::Internal::Types::Enum

            HOSPITAL = "HOSPITAL"
            REFERRING_MD = "REFERRING_MD"
            SELF = "SELF"
            OTHER = "OTHER"
          end
        end
      end
    end
  end
end
