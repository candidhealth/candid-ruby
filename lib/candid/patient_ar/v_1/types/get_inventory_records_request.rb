# frozen_string_literal: true

module Candid
  module PatientAr
    module V1
      module Types
        class GetInventoryRecordsRequest < Internal::Types::Model
          field :since, -> { String }, optional: true, nullable: false
          field :limit, -> { Integer }, optional: true, nullable: false
          field :page_token, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
