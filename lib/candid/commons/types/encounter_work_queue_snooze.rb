# frozen_string_literal: true

module Candid
  module Commons
    module Types
      class EncounterWorkQueueSnooze < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
        field :created_by, -> { String }, optional: false, nullable: false
        field :updated_by, -> { String }, optional: true, nullable: false
        field :snooze_reason, -> { Candid::Commons::Types::SnoozeReason }, optional: false, nullable: false
        field :comments, -> { String }, optional: true, nullable: false
        field :start_date, -> { String }, optional: false, nullable: false
        field :end_date, -> { String }, optional: false, nullable: false
      end
    end
  end
end
