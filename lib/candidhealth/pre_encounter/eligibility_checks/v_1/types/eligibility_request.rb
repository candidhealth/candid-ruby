# frozen_string_literal: true

require_relative "provider"
require_relative "../../../coverages/v_1/types/member_info"
require_relative "encounter"
require "ostruct"
require "json"

module CandidApiClient
  module PreEncounter
    module EligibilityChecks
      module V1
        module Types
          # An object representing the data for an eligibility request.
          class EligibilityRequest
            # @return [String] Supported payer ID values can be found
            #  [here](https://www.stedi.com/healthcare/network).
            attr_reader :payer_id
            # @return [CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::Provider]
            attr_reader :provider
            # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::MemberInfo] The primary policyholder for the insurance plan or a dependent with a unique
            #  member ID. <Note>If a dependent has a unique member ID, include their
            #  information here and leave dependent undefined.</Note>
            attr_reader :subscriber
            # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::MemberInfo] <Note>If a dependent has a unique member ID, include their information as
            #  subscriber and leave this field undefined.</Note>
            attr_reader :dependent
            # @return [CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::Encounter]
            attr_reader :encounter
            # @return [OpenStruct] Additional properties unmapped to the current class definition
            attr_reader :additional_properties
            # @return [Object]
            attr_reader :_field_set
            protected :_field_set

            OMIT = Object.new

            # @param payer_id [String] Supported payer ID values can be found
            #  [here](https://www.stedi.com/healthcare/network).
            # @param provider [CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::Provider]
            # @param subscriber [CandidApiClient::PreEncounter::Coverages::V1::Types::MemberInfo] The primary policyholder for the insurance plan or a dependent with a unique
            #  member ID. <Note>If a dependent has a unique member ID, include their
            #  information here and leave dependent undefined.</Note>
            # @param dependent [CandidApiClient::PreEncounter::Coverages::V1::Types::MemberInfo] <Note>If a dependent has a unique member ID, include their information as
            #  subscriber and leave this field undefined.</Note>
            # @param encounter [CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::Encounter]
            # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
            # @return [CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::EligibilityRequest]
            def initialize(payer_id:, provider:, subscriber:, dependent: OMIT, encounter: OMIT,
                           additional_properties: nil)
              @payer_id = payer_id
              @provider = provider
              @subscriber = subscriber
              @dependent = dependent if dependent != OMIT
              @encounter = encounter if encounter != OMIT
              @additional_properties = additional_properties
              @_field_set = {
                "payer_id": payer_id,
                "provider": provider,
                "subscriber": subscriber,
                "dependent": dependent,
                "encounter": encounter
              }.reject do |_k, v|
                v == OMIT
              end
            end

            # Deserialize a JSON object to an instance of EligibilityRequest
            #
            # @param json_object [String]
            # @return [CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::EligibilityRequest]
            def self.from_json(json_object:)
              struct = JSON.parse(json_object, object_class: OpenStruct)
              parsed_json = JSON.parse(json_object)
              payer_id = struct["payer_id"]
              if parsed_json["provider"].nil?
                provider = nil
              else
                provider = parsed_json["provider"].to_json
                provider = CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::Provider.from_json(json_object: provider)
              end
              if parsed_json["subscriber"].nil?
                subscriber = nil
              else
                subscriber = parsed_json["subscriber"].to_json
                subscriber = CandidApiClient::PreEncounter::Coverages::V1::Types::MemberInfo.from_json(json_object: subscriber)
              end
              if parsed_json["dependent"].nil?
                dependent = nil
              else
                dependent = parsed_json["dependent"].to_json
                dependent = CandidApiClient::PreEncounter::Coverages::V1::Types::MemberInfo.from_json(json_object: dependent)
              end
              if parsed_json["encounter"].nil?
                encounter = nil
              else
                encounter = parsed_json["encounter"].to_json
                encounter = CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::Encounter.from_json(json_object: encounter)
              end
              new(
                payer_id: payer_id,
                provider: provider,
                subscriber: subscriber,
                dependent: dependent,
                encounter: encounter,
                additional_properties: struct
              )
            end

            # Serialize an instance of EligibilityRequest to a JSON object
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
              obj.payer_id.is_a?(String) != false || raise("Passed value for field obj.payer_id is not the expected type, validation failed.")
              CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::Provider.validate_raw(obj: obj.provider)
              CandidApiClient::PreEncounter::Coverages::V1::Types::MemberInfo.validate_raw(obj: obj.subscriber)
              obj.dependent.nil? || CandidApiClient::PreEncounter::Coverages::V1::Types::MemberInfo.validate_raw(obj: obj.dependent)
              obj.encounter.nil? || CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::Encounter.validate_raw(obj: obj.encounter)
            end
          end
        end
      end
    end
  end
end
