# frozen_string_literal: true

module Candid
  module FeeSchedules
    module V3
      module Types
        class RateUploadWithPossibleErrors < Internal::Types::Model
          field :rate_upload, -> { Candid::FeeSchedules::V3::Types::RateUpload }, optional: false, nullable: false
          field :existing_rate, -> { Candid::FeeSchedules::V3::Types::Rate }, optional: true, nullable: false
          field :possible_errors, lambda {
            Internal::Types::Array[Candid::FeeSchedules::V3::Types::ValidationError]
          }, optional: false, nullable: false
        end
      end
    end
  end
end
