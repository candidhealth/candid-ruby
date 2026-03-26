# frozen_string_literal: true

module Candid
  module ChargeCapture
    module V1
      module Types
        class FindByMetadataRequest < Internal::Types::Model
          field :metadata, -> { Internal::Types::Array[Candid::CustomSchemas::V1::Types::SchemaInstance] }, optional: false, nullable: false
          field :limit, -> { Integer }, optional: true, nullable: false
          field :page_token, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
