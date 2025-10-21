# frozen_string_literal: true

require_relative "../../../common/types/external_provider"
require_relative "../../../common/types/period"
require_relative "../../../common/types/patient_service_facility"
require_relative "referral_unit"
require "ostruct"
require "json"

module CandidApiClient
  module PreEncounter
    module Patients
      module V1
        module Types
          class Referral
            # @return [CandidApiClient::PreEncounter::Common::Types::ExternalProvider]
            attr_reader :provider
            # @return [String]
            attr_reader :referral_number
            # @return [CandidApiClient::PreEncounter::Common::Types::Period]
            attr_reader :period
            # @return [String]
            attr_reader :notes
            # @return [CandidApiClient::PreEncounter::Common::Types::PatientServiceFacility]
            attr_reader :service_facility
            # @return [CandidApiClient::PreEncounter::Patients::V1::Types::ReferralUnit]
            attr_reader :units
            # @return [Integer]
            attr_reader :quantity
            # @return [Array<String>]
            attr_reader :cpt_codes
            # @return [Boolean]
            attr_reader :apply_for_all_cpt_codes
            # @return [OpenStruct] Additional properties unmapped to the current class definition
            attr_reader :additional_properties
            # @return [Object]
            attr_reader :_field_set
            protected :_field_set

            OMIT = Object.new

            # @param provider [CandidApiClient::PreEncounter::Common::Types::ExternalProvider]
            # @param referral_number [String]
            # @param period [CandidApiClient::PreEncounter::Common::Types::Period]
            # @param notes [String]
            # @param service_facility [CandidApiClient::PreEncounter::Common::Types::PatientServiceFacility]
            # @param units [CandidApiClient::PreEncounter::Patients::V1::Types::ReferralUnit]
            # @param quantity [Integer]
            # @param cpt_codes [Array<String>]
            # @param apply_for_all_cpt_codes [Boolean]
            # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
            # @return [CandidApiClient::PreEncounter::Patients::V1::Types::Referral]
            def initialize(provider:, referral_number:, period: OMIT, notes: OMIT, service_facility: OMIT, units: OMIT,
                           quantity: OMIT, cpt_codes: OMIT, apply_for_all_cpt_codes: OMIT, additional_properties: nil)
              @provider = provider
              @referral_number = referral_number
              @period = period if period != OMIT
              @notes = notes if notes != OMIT
              @service_facility = service_facility if service_facility != OMIT
              @units = units if units != OMIT
              @quantity = quantity if quantity != OMIT
              @cpt_codes = cpt_codes if cpt_codes != OMIT
              @apply_for_all_cpt_codes = apply_for_all_cpt_codes if apply_for_all_cpt_codes != OMIT
              @additional_properties = additional_properties
              @_field_set = {
                "provider": provider,
                "referral_number": referral_number,
                "period": period,
                "notes": notes,
                "serviceFacility": service_facility,
                "units": units,
                "quantity": quantity,
                "cptCodes": cpt_codes,
                "applyForAllCptCodes": apply_for_all_cpt_codes
              }.reject do |_k, v|
                v == OMIT
              end
            end

            # Deserialize a JSON object to an instance of Referral
            #
            # @param json_object [String]
            # @return [CandidApiClient::PreEncounter::Patients::V1::Types::Referral]
            def self.from_json(json_object:)
              struct = JSON.parse(json_object, object_class: OpenStruct)
              parsed_json = JSON.parse(json_object)
              if parsed_json["provider"].nil?
                provider = nil
              else
                provider = parsed_json["provider"].to_json
                provider = CandidApiClient::PreEncounter::Common::Types::ExternalProvider.from_json(json_object: provider)
              end
              referral_number = struct["referral_number"]
              if parsed_json["period"].nil?
                period = nil
              else
                period = parsed_json["period"].to_json
                period = CandidApiClient::PreEncounter::Common::Types::Period.from_json(json_object: period)
              end
              notes = struct["notes"]
              if parsed_json["serviceFacility"].nil?
                service_facility = nil
              else
                service_facility = parsed_json["serviceFacility"].to_json
                service_facility = CandidApiClient::PreEncounter::Common::Types::PatientServiceFacility.from_json(json_object: service_facility)
              end
              units = struct["units"]
              quantity = struct["quantity"]
              cpt_codes = struct["cptCodes"]
              apply_for_all_cpt_codes = struct["applyForAllCptCodes"]
              new(
                provider: provider,
                referral_number: referral_number,
                period: period,
                notes: notes,
                service_facility: service_facility,
                units: units,
                quantity: quantity,
                cpt_codes: cpt_codes,
                apply_for_all_cpt_codes: apply_for_all_cpt_codes,
                additional_properties: struct
              )
            end

            # Serialize an instance of Referral to a JSON object
            #
            # @return [String]
            def to_json(*_args)
              @_field_set&.to_json
            end

            # Leveraged for Union-type generation, validate_raw attempts to parse the given
            #  hash and check each fields type against the current object's property
            #  definitions.
            #
            # @param obj [Object]
            # @return [Void]
            def self.validate_raw(obj:)
              CandidApiClient::PreEncounter::Common::Types::ExternalProvider.validate_raw(obj: obj.provider)
              obj.referral_number.is_a?(String) != false || raise("Passed value for field obj.referral_number is not the expected type, validation failed.")
              obj.period.nil? || CandidApiClient::PreEncounter::Common::Types::Period.validate_raw(obj: obj.period)
              obj.notes&.is_a?(String) != false || raise("Passed value for field obj.notes is not the expected type, validation failed.")
              obj.service_facility.nil? || CandidApiClient::PreEncounter::Common::Types::PatientServiceFacility.validate_raw(obj: obj.service_facility)
              obj.units&.is_a?(CandidApiClient::PreEncounter::Patients::V1::Types::ReferralUnit) != false || raise("Passed value for field obj.units is not the expected type, validation failed.")
              obj.quantity&.is_a?(Integer) != false || raise("Passed value for field obj.quantity is not the expected type, validation failed.")
              obj.cpt_codes&.is_a?(Array) != false || raise("Passed value for field obj.cpt_codes is not the expected type, validation failed.")
              obj.apply_for_all_cpt_codes&.is_a?(Boolean) != false || raise("Passed value for field obj.apply_for_all_cpt_codes is not the expected type, validation failed.")
            end
          end
        end
      end
    end
  end
end
