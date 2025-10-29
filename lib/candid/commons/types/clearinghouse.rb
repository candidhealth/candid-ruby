# frozen_string_literal: true

module Candid
  module Commons
    module Types
      module Clearinghouse
        extend Candid::Internal::Types::Enum

        CHANGE_HEALTHCARE = "CHANGE_HEALTHCARE"
        OLIVE = "OLIVE"
        UCSF_CIRIUS = "UCSF_CIRIUS"
        AVAILITY = "AVAILITY"
        PAYER_PORTAL = "PAYER_PORTAL"
        STEDI = "STEDI"
        WAYSTAR = "WAYSTAR"
        UNKNOWN = "UNKNOWN"
      end
    end
  end
end
