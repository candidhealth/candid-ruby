# frozen_string_literal: true

module Candid
  module Encounters
    module V4
      module Types
        module EncounterSortOptions
          extend Candid::Internal::Types::Enum

          CREATED_AT_ASC = "created_at:asc"
          CREATED_AT_DESC = "created_at:desc"
          DATE_OF_SERVICE_ASC = "date_of_service:asc"
          DATE_OF_SERVICE_DESC = "date_of_service:desc"
        end
      end
    end
  end
end
