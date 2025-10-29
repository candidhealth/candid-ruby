# frozen_string_literal: true

module Candid
  module Encounters
    module V4
      module Types
        module BillableStatusType
          extend Candid::Internal::Types::Enum

          BILLABLE = "BILLABLE"
          NOT_BILLABLE = "NOT_BILLABLE"
        end
      end
    end
  end
end
