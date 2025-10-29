# frozen_string_literal: true

module Candid
  module Era
    module Types
      class EraBase < Internal::Types::Model
        field :check_number, -> { String }, optional: false, nullable: false
        field :check_date, -> { String }, optional: false, nullable: false
      end
    end
  end
end
