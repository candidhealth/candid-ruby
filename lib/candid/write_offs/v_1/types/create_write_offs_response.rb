# frozen_string_literal: true

module Candid
  module WriteOffs
    module V1
      module Types
        class CreateWriteOffsResponse < Internal::Types::Model
          field :write_offs, -> { Internal::Types::Array[Candid::WriteOffs::V1::Types::WriteOff] }, optional: false, nullable: false

        end
      end
    end
  end
end
