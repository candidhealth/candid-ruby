# frozen_string_literal: true

module Candid
  module Encounters
    module V4
      module Types
        class EncounterCreateFromPreEncounter < Internal::Types::Model
          field :rendering_provider, lambda {
            Candid::EncounterProviders::V2::Types::RenderingProvider
          }, optional: false, nullable: false
          field :place_of_service_code, lambda {
            Candid::Commons::Types::FacilityTypeCode
          }, optional: false, nullable: false
          field :diagnoses, lambda {
            Internal::Types::Array[Candid::Diagnoses::Types::DiagnosisCreate]
          }, optional: false, nullable: false
          field :service_lines, lambda {
            Internal::Types::Array[Candid::ServiceLines::V2::Types::ServiceLineCreate]
          }, optional: true, nullable: false
        end
      end
    end
  end
end
