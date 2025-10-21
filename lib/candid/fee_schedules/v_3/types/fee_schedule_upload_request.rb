
module Candid
  module FeeSchedules
    module V3
      module Types
        class FeeScheduleUploadRequest < Internal::Types::Model
          field :dry_run, -> { Internal::Types::Boolean }, optional: false, nullable: false
          field :rates, -> { Internal::Types::Array[Candid::FeeSchedules::V3::Types::RateUpload] }, optional: false, nullable: false

        end
      end
    end
  end
end
