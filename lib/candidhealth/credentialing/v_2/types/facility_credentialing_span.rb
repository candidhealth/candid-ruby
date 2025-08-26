# frozen_string_literal: true

require_relative "../../../organization_service_facilities/v_2/types/organization_service_facility"
require_relative "../../../organization_providers/v_3/types/organization_provider_v_2"
require_relative "../../../payers/v_3/types/payer"
require "date"
require_relative "credentialing_span_status"
require "ostruct"
require "json"

module CandidApiClient
  module Credentialing
    module V2
      module Types
        class FacilityCredentialingSpan
          # @return [String]
          attr_reader :facility_credentialing_span_id
          # @return [CandidApiClient::OrganizationServiceFacilities::V2::Types::OrganizationServiceFacility] The service facility covered by the credentialing span.
          attr_reader :service_facility
          # @return [CandidApiClient::OrganizationProviders::V3::Types::OrganizationProviderV2] The practice location at which the rendering provider is covered by the
          #  credentialing span.
          attr_reader :contracting_provider
          # @return [CandidApiClient::Payers::V3::Types::Payer] The payer doing the credentialing.
          attr_reader :payer
          # @return [Date] Start date of the credentialing span.
          attr_reader :start_date
          # @return [Date] End date of the credentialing span.
          attr_reader :end_date
          # @return [Date] Date that the credential paperwork was submitted.
          attr_reader :submitted_date
          # @return [CandidApiClient::Credentialing::V2::Types::CredentialingSpanStatus] Status of the credentialing span.
          attr_reader :credentialing_status
          # @return [Date] Date that the payer loaded the credentialing span into their system.
          attr_reader :payer_loaded_date
          # @return [Boolean] Is the credentialing span enabled?
          attr_reader :is_enabled
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param facility_credentialing_span_id [String]
          # @param service_facility [CandidApiClient::OrganizationServiceFacilities::V2::Types::OrganizationServiceFacility] The service facility covered by the credentialing span.
          # @param contracting_provider [CandidApiClient::OrganizationProviders::V3::Types::OrganizationProviderV2] The practice location at which the rendering provider is covered by the
          #  credentialing span.
          # @param payer [CandidApiClient::Payers::V3::Types::Payer] The payer doing the credentialing.
          # @param start_date [Date] Start date of the credentialing span.
          # @param end_date [Date] End date of the credentialing span.
          # @param submitted_date [Date] Date that the credential paperwork was submitted.
          # @param credentialing_status [CandidApiClient::Credentialing::V2::Types::CredentialingSpanStatus] Status of the credentialing span.
          # @param payer_loaded_date [Date] Date that the payer loaded the credentialing span into their system.
          # @param is_enabled [Boolean] Is the credentialing span enabled?
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::Credentialing::V2::Types::FacilityCredentialingSpan]
          def initialize(facility_credentialing_span_id:, service_facility:, contracting_provider:, payer:, credentialing_status:, is_enabled:,
                         start_date: OMIT, end_date: OMIT, submitted_date: OMIT, payer_loaded_date: OMIT, additional_properties: nil)
            @facility_credentialing_span_id = facility_credentialing_span_id
            @service_facility = service_facility
            @contracting_provider = contracting_provider
            @payer = payer
            @start_date = start_date if start_date != OMIT
            @end_date = end_date if end_date != OMIT
            @submitted_date = submitted_date if submitted_date != OMIT
            @credentialing_status = credentialing_status
            @payer_loaded_date = payer_loaded_date if payer_loaded_date != OMIT
            @is_enabled = is_enabled
            @additional_properties = additional_properties
            @_field_set = {
              "facility_credentialing_span_id": facility_credentialing_span_id,
              "service_facility": service_facility,
              "contracting_provider": contracting_provider,
              "payer": payer,
              "start_date": start_date,
              "end_date": end_date,
              "submitted_date": submitted_date,
              "credentialing_status": credentialing_status,
              "payer_loaded_date": payer_loaded_date,
              "is_enabled": is_enabled
            }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of FacilityCredentialingSpan
          #
          # @param json_object [String]
          # @return [CandidApiClient::Credentialing::V2::Types::FacilityCredentialingSpan]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            facility_credentialing_span_id = struct["facility_credentialing_span_id"]
            if parsed_json["service_facility"].nil?
              service_facility = nil
            else
              service_facility = parsed_json["service_facility"].to_json
              service_facility = CandidApiClient::OrganizationServiceFacilities::V2::Types::OrganizationServiceFacility.from_json(json_object: service_facility)
            end
            if parsed_json["contracting_provider"].nil?
              contracting_provider = nil
            else
              contracting_provider = parsed_json["contracting_provider"].to_json
              contracting_provider = CandidApiClient::OrganizationProviders::V3::Types::OrganizationProviderV2.from_json(json_object: contracting_provider)
            end
            if parsed_json["payer"].nil?
              payer = nil
            else
              payer = parsed_json["payer"].to_json
              payer = CandidApiClient::Payers::V3::Types::Payer.from_json(json_object: payer)
            end
            start_date = (Date.parse(parsed_json["start_date"]) unless parsed_json["start_date"].nil?)
            end_date = (Date.parse(parsed_json["end_date"]) unless parsed_json["end_date"].nil?)
            submitted_date = (Date.parse(parsed_json["submitted_date"]) unless parsed_json["submitted_date"].nil?)
            credentialing_status = struct["credentialing_status"]
            payer_loaded_date = unless parsed_json["payer_loaded_date"].nil?
                                  Date.parse(parsed_json["payer_loaded_date"])
                                end
            is_enabled = struct["is_enabled"]
            new(
              facility_credentialing_span_id: facility_credentialing_span_id,
              service_facility: service_facility,
              contracting_provider: contracting_provider,
              payer: payer,
              start_date: start_date,
              end_date: end_date,
              submitted_date: submitted_date,
              credentialing_status: credentialing_status,
              payer_loaded_date: payer_loaded_date,
              is_enabled: is_enabled,
              additional_properties: struct
            )
          end

          # Serialize an instance of FacilityCredentialingSpan to a JSON object
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
            obj.facility_credentialing_span_id.is_a?(String) != false || raise("Passed value for field obj.facility_credentialing_span_id is not the expected type, validation failed.")
            CandidApiClient::OrganizationServiceFacilities::V2::Types::OrganizationServiceFacility.validate_raw(obj: obj.service_facility)
            CandidApiClient::OrganizationProviders::V3::Types::OrganizationProviderV2.validate_raw(obj: obj.contracting_provider)
            CandidApiClient::Payers::V3::Types::Payer.validate_raw(obj: obj.payer)
            obj.start_date&.is_a?(Date) != false || raise("Passed value for field obj.start_date is not the expected type, validation failed.")
            obj.end_date&.is_a?(Date) != false || raise("Passed value for field obj.end_date is not the expected type, validation failed.")
            obj.submitted_date&.is_a?(Date) != false || raise("Passed value for field obj.submitted_date is not the expected type, validation failed.")
            obj.credentialing_status.is_a?(CandidApiClient::Credentialing::V2::Types::CredentialingSpanStatus) != false || raise("Passed value for field obj.credentialing_status is not the expected type, validation failed.")
            obj.payer_loaded_date&.is_a?(Date) != false || raise("Passed value for field obj.payer_loaded_date is not the expected type, validation failed.")
            obj.is_enabled.is_a?(Boolean) != false || raise("Passed value for field obj.is_enabled is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
