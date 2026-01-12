# frozen_string_literal: true

module Candid
  module Eras
    module Types
      class Era < Internal::Types::Model
        field :era_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
