# frozen_string_literal: true

module Candid
  module PreEncounter
    module Coverages
      module V1
        module Types
          module CarveOutType
            extend Candid::Internal::Types::Enum

            BEHAVIORAL = "BEHAVIORAL"
            MEDICAL = "MEDICAL"
            THERAPY = "THERAPY"
            OTHER = "OTHER"
            ABA = "ABA"
            FWC = "FWC"
            OT = "OT"
            SLP = "SLP"
            PT = "PT"
            EEG = "EEG"
            CES = "CES"
          end
        end
      end
    end
  end
end
