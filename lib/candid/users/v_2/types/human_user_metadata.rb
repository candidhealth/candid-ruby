# frozen_string_literal: true

module Candid
  module Users
    module V2
      module Types
        class HumanUserMetadata < Internal::Types::Model
          field :first_name, -> { String }, optional: false, nullable: false
          field :last_name, -> { String }, optional: false, nullable: false
          field :email, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
