# frozen_string_literal: true

module Candid
  module Individual
    module Types
      class IndividualBase < Internal::Types::Model
        field :first_name, -> { String }, optional: false, nullable: false
        field :last_name, -> { String }, optional: false, nullable: false
        field :gender, -> { Candid::Individual::Types::Gender }, optional: false, nullable: false
      end
    end
  end
end
