# frozen_string_literal: true

module Candid
  module Individual
    module Types
      class IndividualBaseOptional < Internal::Types::Model
        field :first_name, -> { String }, optional: true, nullable: false
        field :last_name, -> { String }, optional: true, nullable: false
        field :gender, -> { Candid::Individual::Types::Gender }, optional: true, nullable: false
      end
    end
  end
end
