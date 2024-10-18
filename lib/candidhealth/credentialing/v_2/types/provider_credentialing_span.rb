# frozen_string_literal: true

require_relative "../../../organization_providers/v_3/types/organization_provider_v_2"
require_relative "../../../payers/v_3/types/payer"
require "date"
require_relative "../../../commons/types/regions"
require_relative "credentialing_span_status"
require "ostruct"
require "json"

module CandidApiClient
  module Credentialing
    module V2
      module Types
        class ProviderCredentialingSpan
          # @return [String]
          attr_reader :provider_credentialing_span_id
          # @return [CandidApiClient::OrganizationProviders::V3::Types::OrganizationProviderV2] The rendering provider covered by the credentialing span.
          attr_reader :rendering_provider
          # @return [CandidApiClient::OrganizationProviders::V3::Types::OrganizationProviderV2] The practice location at which the rendering provider is covered by the
          #  credentialing span.
          attr_reader :contracting_provider
          # @return [CandidApiClient::Payers::V3::Types::Payer] The payer doing the credentialing.
          attr_reader :payer
          # @return [Date] Start date of the credentialing span.
          attr_reader :start_date
          # @return [Date] End date of the credentialing span.
          attr_reader :end_date
          # @return [CandidApiClient::Commons::Types::Regions] The states covered by the credentialing span. A span may be national and cover
          #  all states.
          attr_reader :regions
          # @return [Date] Date that the credential paperwork was submitted.
          attr_reader :submitted_date
          # @return [CandidApiClient::Credentialing::V2::Types::CredentialingSpanStatus] Status of the credentialing span.
          attr_reader :credentialing_status
          # @return [Date] Date that the payer loaded the credentialing span into their system.
          attr_reader :payer_loaded_date
          # @return [String] Source of the credentialing span.
          attr_reader :source
          # @return [String] Provider ID for the related medallion payer enrollment.
          attr_reader :medallion_payer_enrollment_id
          # @return [Boolean] Is the credentialing span enabled?
          attr_reader :is_enabled
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param provider_credentialing_span_id [String]
          # @param rendering_provider [CandidApiClient::OrganizationProviders::V3::Types::OrganizationProviderV2] The rendering provider covered by the credentialing span.
          # @param contracting_provider [CandidApiClient::OrganizationProviders::V3::Types::OrganizationProviderV2] The practice location at which the rendering provider is covered by the
          #  credentialing span.
          # @param payer [CandidApiClient::Payers::V3::Types::Payer] The payer doing the credentialing.
          # @param start_date [Date] Start date of the credentialing span.
          # @param end_date [Date] End date of the credentialing span.
          # @param regions [CandidApiClient::Commons::Types::Regions] The states covered by the credentialing span. A span may be national and cover
          #  all states.
          # @param submitted_date [Date] Date that the credential paperwork was submitted.
          # @param credentialing_status [CandidApiClient::Credentialing::V2::Types::CredentialingSpanStatus] Status of the credentialing span.
          # @param payer_loaded_date [Date] Date that the payer loaded the credentialing span into their system.
          # @param source [String] Source of the credentialing span.
          # @param medallion_payer_enrollment_id [String] Provider ID for the related medallion payer enrollment.
          # @param is_enabled [Boolean] Is the credentialing span enabled?
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::Credentialing::V2::Types::ProviderCredentialingSpan]
          def initialize(provider_credentialing_span_id:, rendering_provider:, contracting_provider:, payer:, regions:, credentialing_status:, source:, is_enabled:,
                         start_date: OMIT, end_date: OMIT, submitted_date: OMIT, payer_loaded_date: OMIT, medallion_payer_enrollment_id: OMIT, additional_properties: nil)
            @provider_credentialing_span_id = provider_credentialing_span_id
            @rendering_provider = rendering_provider
            @contracting_provider = contracting_provider
            @payer = payer
            @start_date = start_date if start_date != OMIT
            @end_date = end_date if end_date != OMIT
            @regions = regions
            @submitted_date = submitted_date if submitted_date != OMIT
            @credentialing_status = credentialing_status
            @payer_loaded_date = payer_loaded_date if payer_loaded_date != OMIT
            @source = source
            @medallion_payer_enrollment_id = medallion_payer_enrollment_id if medallion_payer_enrollment_id != OMIT
            @is_enabled = is_enabled
            @additional_properties = additional_properties
            @_field_set = {
              "provider_credentialing_span_id": provider_credentialing_span_id,
              "rendering_provider": rendering_provider,
              "contracting_provider": contracting_provider,
              "payer": payer,
              "start_date": start_date,
              "end_date": end_date,
              "regions": regions,
              "submitted_date": submitted_date,
              "credentialing_status": credentialing_status,
              "payer_loaded_date": payer_loaded_date,
              "source": source,
              "medallion_payer_enrollment_id": medallion_payer_enrollment_id,
              "is_enabled": is_enabled
            }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of ProviderCredentialingSpan
          #
          # @param json_object [String]
          # @return [CandidApiClient::Credentialing::V2::Types::ProviderCredentialingSpan]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            provider_credentialing_span_id = struct["provider_credentialing_span_id"]
            if parsed_json["rendering_provider"].nil?
              rendering_provider = nil
            else
              rendering_provider = parsed_json["rendering_provider"].to_json
              rendering_provider = CandidApiClient::OrganizationProviders::V3::Types::OrganizationProviderV2.from_json(json_object: rendering_provider)
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
            if parsed_json["regions"].nil?
              regions = nil
            else
              regions = parsed_json["regions"].to_json
              regions = CandidApiClient::Commons::Types::Regions.from_json(json_object: regions)
            end
            submitted_date = (Date.parse(parsed_json["submitted_date"]) unless parsed_json["submitted_date"].nil?)
            credentialing_status = struct["credentialing_status"]
            payer_loaded_date = unless parsed_json["payer_loaded_date"].nil?
                                  Date.parse(parsed_json["payer_loaded_date"])
                                end
            source = struct["source"]
            medallion_payer_enrollment_id = struct["medallion_payer_enrollment_id"]
            is_enabled = struct["is_enabled"]
            new(
              provider_credentialing_span_id: provider_credentialing_span_id,
              rendering_provider: rendering_provider,
              contracting_provider: contracting_provider,
              payer: payer,
              start_date: start_date,
              end_date: end_date,
              regions: regions,
              submitted_date: submitted_date,
              credentialing_status: credentialing_status,
              payer_loaded_date: payer_loaded_date,
              source: source,
              medallion_payer_enrollment_id: medallion_payer_enrollment_id,
              is_enabled: is_enabled,
              additional_properties: struct
            )
          end

          # Serialize an instance of ProviderCredentialingSpan to a JSON object
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
            obj.provider_credentialing_span_id.is_a?(String) != false || raise("Passed value for field obj.provider_credentialing_span_id is not the expected type, validation failed.")
            CandidApiClient::OrganizationProviders::V3::Types::OrganizationProviderV2.validate_raw(obj: obj.rendering_provider)
            CandidApiClient::OrganizationProviders::V3::Types::OrganizationProviderV2.validate_raw(obj: obj.contracting_provider)
            CandidApiClient::Payers::V3::Types::Payer.validate_raw(obj: obj.payer)
            obj.start_date&.is_a?(Date) != false || raise("Passed value for field obj.start_date is not the expected type, validation failed.")
            obj.end_date&.is_a?(Date) != false || raise("Passed value for field obj.end_date is not the expected type, validation failed.")
            CandidApiClient::Commons::Types::Regions.validate_raw(obj: obj.regions)
            obj.submitted_date&.is_a?(Date) != false || raise("Passed value for field obj.submitted_date is not the expected type, validation failed.")
            obj.credentialing_status.is_a?(CandidApiClient::Credentialing::V2::Types::CredentialingSpanStatus) != false || raise("Passed value for field obj.credentialing_status is not the expected type, validation failed.")
            obj.payer_loaded_date&.is_a?(Date) != false || raise("Passed value for field obj.payer_loaded_date is not the expected type, validation failed.")
            obj.source.is_a?(String) != false || raise("Passed value for field obj.source is not the expected type, validation failed.")
            obj.medallion_payer_enrollment_id&.is_a?(String) != false || raise("Passed value for field obj.medallion_payer_enrollment_id is not the expected type, validation failed.")
            obj.is_enabled.is_a?(Boolean) != false || raise("Passed value for field obj.is_enabled is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
