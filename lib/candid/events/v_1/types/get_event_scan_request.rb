# frozen_string_literal: true

module Candid
  module Events
    module V1
      module Types
        class GetEventScanRequest < Internal::Types::Model
          field :page_token, -> { String }, optional: true, nullable: false
          field :limit, -> { Integer }, optional: true, nullable: false
          field :event_types, -> { String }, optional: true, nullable: false
          field :created_before, -> { String }, optional: true, nullable: false
          field :created_after, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
