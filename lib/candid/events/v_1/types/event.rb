# frozen_string_literal: true

module Candid
  module Events
    module V1
      module Types
        class Event < Internal::Types::Model
          field :id, -> { String }, optional: false, nullable: false
          field :created_at, -> { String }, optional: false, nullable: false
          field :timestamp, -> { String }, optional: false, nullable: false
          field :event_type, -> { String }, optional: false, nullable: false
          field :schema_version, -> { String }, optional: false, nullable: false
          field :payload, -> { Internal::Types::Hash[String, Object] }, optional: false, nullable: false
        end
      end
    end
  end
end
