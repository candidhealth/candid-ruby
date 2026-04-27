# frozen_string_literal: true

module Candid
  module PreEncounter
    module Patients
      module V1
        module Types
          # Granular consent for electronic communication channels.
          class ElectronicCommunicationConsent < Internal::Types::Model
            field :text_communication_consent, -> { Internal::Types::Boolean }, optional: true, nullable: false
            field :email_communication_consent, -> { Internal::Types::Boolean }, optional: true, nullable: false
          end
        end
      end
    end
  end
end
