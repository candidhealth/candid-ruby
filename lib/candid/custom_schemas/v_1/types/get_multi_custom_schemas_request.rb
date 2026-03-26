# frozen_string_literal: true

module Candid
  module CustomSchemas
    module V1
      module Types
        class GetMultiCustomSchemasRequest < Internal::Types::Model
          field :organization_id, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
