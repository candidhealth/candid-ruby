# frozen_string_literal: true

module Candid
  module PatientAr
    module V1
      module Types
        class ListInventoryPagedResponse < Internal::Types::Model
          field :records, -> { Internal::Types::Array[Candid::PatientAr::V1::Types::InventoryRecord] }, optional: false, nullable: false
          field :next_page_token, -> { String }, optional: true, nullable: false

        end
      end
    end
  end
end
