# frozen_string_literal: true

module Candid
  module Individual
    module Types
      class SubscriberBase < Internal::Types::Model
        field :patient_relationship_to_subscriber_code, -> { Candid::Commons::Types::PatientRelationshipToInsuredCodeAll }, optional: false, nullable: false
        field :date_of_birth, -> { String }, optional: true, nullable: false
        field :address, -> { Candid::Commons::Types::StreetAddressShortZip }, optional: true, nullable: false

      end
    end
  end
end
