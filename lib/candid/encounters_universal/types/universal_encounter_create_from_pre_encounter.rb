# frozen_string_literal: true

module Candid
  module EncountersUniversal
    module Types
      class UniversalEncounterCreateFromPreEncounter < Internal::Types::Model
        field :submission_expectation, lambda {
          Candid::Encounters::V4::Types::EncounterSubmissionExpectation
        }, optional: false, nullable: false
        field :rendering_provider, lambda {
          Candid::EncounterProviders::V2::Types::RenderingProvider
        }, optional: true, nullable: false
        field :health_care_code_information, lambda {
          Candid::HealthCareCodeInformation::V1::Types::HealthCareCodeInformationCreate
        }, optional: true, nullable: false
        field :place_of_service_code, -> { Candid::Commons::Types::FacilityTypeCode }, optional: true, nullable: false
        field :service_lines, lambda {
          Internal::Types::Array[Candid::ServiceLines::V2::Types::UniversalServiceLineCreate]
        }, optional: true, nullable: false
        field :attending_provider, lambda {
          Candid::EncounterProviders::V2::Types::RenderingProvider
        }, optional: true, nullable: false
        field :admission_hour, -> { Integer }, optional: true, nullable: false
        field :admission_type_code, lambda {
          Candid::X12::V1::Types::TypeOfAdmissionOrVisitCode
        }, optional: true, nullable: false
        field :admission_source_code, lambda {
          Candid::X12::V1::Types::PointOfOriginForAdmissionOrVisitCode
        }, optional: true, nullable: false
        field :discharge_hour, -> { Integer }, optional: true, nullable: false
        field :discharge_status, lambda {
          Candid::X12::V1::Types::PatientDischargeStatusCode
        }, optional: true, nullable: false
        field :operating_provider, lambda {
          Candid::EncounterProviders::V2::Types::RenderingProvider
        }, optional: true, nullable: false
        field :other_operating_provider, lambda {
          Candid::EncounterProviders::V2::Types::RenderingProvider
        }, optional: true, nullable: false
        field :type_of_bill, -> { Candid::X12::V1::Types::TypeOfBillCompositeUpdate }, optional: true, nullable: false
        field :accident_state_or_province_code, -> { Candid::Commons::Types::State }, optional: true, nullable: false
      end
    end
  end
end
