# frozen_string_literal: true

module Candid
  module Eras
    module Types
      class EraPayer < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
        field :payer_name, -> { String }, optional: false, nullable: false
        field :payer_identifier, -> { String }, optional: true, nullable: false
      end
    end
  end
end
