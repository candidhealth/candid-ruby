# frozen_string_literal: true

module Candid
  module Contracts
    module V2
      module Types
        class AuthorizedSignatory < Internal::Types::Model
          field :first_name, -> { String }, optional: true, nullable: false
          field :last_name, -> { String }, optional: true, nullable: false
          field :title, -> { String }, optional: true, nullable: false
          field :email, -> { String }, optional: true, nullable: false
          field :phone, -> { String }, optional: true, nullable: false
          field :fax, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
