# frozen_string_literal: true

module Candid
  module Guarantor
    module V1
      module Types
        class GuarantorBase < Internal::Types::Model
          field :first_name, -> { String }, optional: false, nullable: false
          field :last_name, -> { String }, optional: false, nullable: false
          field :external_id, -> { String }, optional: false, nullable: false
          field :date_of_birth, -> { String }, optional: true, nullable: false
          field :address, -> { Candid::Commons::Types::StreetAddressShortZip }, optional: false, nullable: false
        end
      end
    end
  end
end
