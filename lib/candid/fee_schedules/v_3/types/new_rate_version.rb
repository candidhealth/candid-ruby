# frozen_string_literal: true

module Candid
  module FeeSchedules
    module V3
      module Types
        class NewRateVersion < Internal::Types::Model
          field :rate_id, -> { String }, optional: false, nullable: false
          field :previous_version, -> { Integer }, optional: false, nullable: false
          field :entries, lambda {
            Internal::Types::Array[Candid::FeeSchedules::V3::Types::RateEntry]
          }, optional: false, nullable: false
        end
      end
    end
  end
end
