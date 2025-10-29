# frozen_string_literal: true

module Candid
  module WriteOffs
    module V1
      module Types
        class CreateWriteOffsRequest < Internal::Types::Model
          field :write_offs, lambda {
            Internal::Types::Array[Candid::WriteOffs::V1::Types::WriteOffCreate]
          }, optional: false, nullable: false
        end
      end
    end
  end
end
