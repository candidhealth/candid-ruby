# frozen_string_literal: true

module Candid
  module PreEncounter
    module MetadataSchemas
      module V1
        module Types
          class GetAllMetadataSchemasRequest < Internal::Types::Model
            field :limit, -> { Integer }, optional: true, nullable: false
            field :page_token, -> { String }, optional: true, nullable: false
            field :filters, -> { String }, optional: true, nullable: false
          end
        end
      end
    end
  end
end
