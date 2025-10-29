# frozen_string_literal: true

module Candid
  module WriteOffs
    module V1
      module Types
        class WriteOffsPage < Internal::Types::Model
          field :items, lambda {
            Internal::Types::Array[Candid::WriteOffs::V1::Types::WriteOff]
          }, optional: false, nullable: false
        end
      end
    end
  end
end
