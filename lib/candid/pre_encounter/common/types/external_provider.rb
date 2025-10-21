# frozen_string_literal: true

module Candid
  module PreEncounter
    module Common
      module Types
        class ExternalProvider < Internal::Types::Model
          field :name, -> { Candid::PreEncounter::Common::Types::HumanName }, optional: false, nullable: false
          field :type, -> { Candid::PreEncounter::Common::Types::ExternalProviderType }, optional: true, nullable: false
          field :npi, -> { String }, optional: true, nullable: false
          field :telecoms, -> { Internal::Types::Array[Candid::PreEncounter::Common::Types::ContactPoint] }, optional: false, nullable: false
          field :addresses, -> { Internal::Types::Array[Candid::PreEncounter::Common::Types::Address] }, optional: true, nullable: false
          field :period, -> { Candid::PreEncounter::Common::Types::Period }, optional: true, nullable: false
          field :canonical_id, -> { String }, optional: true, nullable: false
          field :fax, -> { String }, optional: true, nullable: false
          field :service_facilities, -> { Internal::Types::Array[Candid::PreEncounter::Common::Types::PatientServiceFacility] }, optional: true, nullable: false

        end
      end
    end
  end
end
