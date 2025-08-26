# frozen_string_literal: true

require_relative "referral_source"
require_relative "../../../common/types/external_provider"
require_relative "specialization_category"
require_relative "referral_type"
require "ostruct"
require "json"

module CandidApiClient
  module PreEncounter
    module Patients
      module V1
        module Types
          class OriginationDetail
            # @return [CandidApiClient::PreEncounter::Patients::V1::Types::ReferralSource]
            attr_reader :referral_source
            # @return [CandidApiClient::PreEncounter::Common::Types::ExternalProvider]
            attr_reader :referring_provider
            # @return [Array<CandidApiClient::PreEncounter::Patients::V1::Types::SpecializationCategory>]
            attr_reader :specialization_categories
            # @return [CandidApiClient::PreEncounter::Patients::V1::Types::ReferralType]
            attr_reader :referral_type
            # @return [OpenStruct] Additional properties unmapped to the current class definition
            attr_reader :additional_properties
            # @return [Object]
            attr_reader :_field_set
            protected :_field_set

            OMIT = Object.new

            # @param referral_source [CandidApiClient::PreEncounter::Patients::V1::Types::ReferralSource]
            # @param referring_provider [CandidApiClient::PreEncounter::Common::Types::ExternalProvider]
            # @param specialization_categories [Array<CandidApiClient::PreEncounter::Patients::V1::Types::SpecializationCategory>]
            # @param referral_type [CandidApiClient::PreEncounter::Patients::V1::Types::ReferralType]
            # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
            # @return [CandidApiClient::PreEncounter::Patients::V1::Types::OriginationDetail]
            def initialize(referral_source:, referring_provider: OMIT, specialization_categories: OMIT,
                           referral_type: OMIT, additional_properties: nil)
              @referral_source = referral_source
              @referring_provider = referring_provider if referring_provider != OMIT
              @specialization_categories = specialization_categories if specialization_categories != OMIT
              @referral_type = referral_type if referral_type != OMIT
              @additional_properties = additional_properties
              @_field_set = {
                "referral_source": referral_source,
                "referring_provider": referring_provider,
                "specialization_categories": specialization_categories,
                "referral_type": referral_type
              }.reject do |_k, v|
                v == OMIT
              end
            end

            # Deserialize a JSON object to an instance of OriginationDetail
            #
            # @param json_object [String]
            # @return [CandidApiClient::PreEncounter::Patients::V1::Types::OriginationDetail]
            def self.from_json(json_object:)
              struct = JSON.parse(json_object, object_class: OpenStruct)
              parsed_json = JSON.parse(json_object)
              referral_source = struct["referral_source"]
              if parsed_json["referring_provider"].nil?
                referring_provider = nil
              else
                referring_provider = parsed_json["referring_provider"].to_json
                referring_provider = CandidApiClient::PreEncounter::Common::Types::ExternalProvider.from_json(json_object: referring_provider)
              end
              specialization_categories = struct["specialization_categories"]
              referral_type = struct["referral_type"]
              new(
                referral_source: referral_source,
                referring_provider: referring_provider,
                specialization_categories: specialization_categories,
                referral_type: referral_type,
                additional_properties: struct
              )
            end

            # Serialize an instance of OriginationDetail to a JSON object
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
              obj.referral_source.is_a?(CandidApiClient::PreEncounter::Patients::V1::Types::ReferralSource) != false || raise("Passed value for field obj.referral_source is not the expected type, validation failed.")
              obj.referring_provider.nil? || CandidApiClient::PreEncounter::Common::Types::ExternalProvider.validate_raw(obj: obj.referring_provider)
              obj.specialization_categories&.is_a?(Array) != false || raise("Passed value for field obj.specialization_categories is not the expected type, validation failed.")
              obj.referral_type&.is_a?(CandidApiClient::PreEncounter::Patients::V1::Types::ReferralType) != false || raise("Passed value for field obj.referral_type is not the expected type, validation failed.")
            end
          end
        end
      end
    end
  end
end
