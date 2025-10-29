# frozen_string_literal: true

module Candid
  module Tags
    module Types
      class Tag < Internal::Types::Model
        field :creator_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
