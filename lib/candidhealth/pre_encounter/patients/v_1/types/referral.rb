# frozen_string_literal: true

require_relative "../../../common/types/external_provider"
require_relative "../../../common/types/period"
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
            # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
            # @return [CandidApiClient::PreEncounter::Patients::V1::Types::Referral]
            def initialize(provider:, referral_number:, period: OMIT, notes: OMIT, additional_properties: nil)
              @provider = provider
              @referral_number = referral_number
              @period = period if period != OMIT
              @notes = notes if notes != OMIT
              @additional_properties = additional_properties
              @_field_set = {
                "provider": provider,
                "referral_number": referral_number,
                "period": period,
                "notes": notes
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
              new(
                provider: provider,
                referral_number: referral_number,
                period: period,
                notes: notes,
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
            end
          end
        end
      end
    end
  end
end
