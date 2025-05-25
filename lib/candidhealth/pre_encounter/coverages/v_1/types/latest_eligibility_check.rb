# frozen_string_literal: true

require_relative "../../../eligibility_checks/v_1/types/eligibility_status"
require "date"
require "ostruct"
require "json"

module CandidApiClient
  module PreEncounter
    module Coverages
      module V1
        module Types
          # A type to represent the latest eligibility check status of a coverage.
          class LatestEligibilityCheck
            # @return [String]
            attr_reader :check_id
            # @return [CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::EligibilityStatus]
            attr_reader :status
            # @return [DateTime]
            attr_reader :initiated_at
            # @return [OpenStruct] Additional properties unmapped to the current class definition
            attr_reader :additional_properties
            # @return [Object]
            attr_reader :_field_set
            protected :_field_set

            OMIT = Object.new

            # @param check_id [String]
            # @param status [CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::EligibilityStatus]
            # @param initiated_at [DateTime]
            # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
            # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::LatestEligibilityCheck]
            def initialize(check_id:, status:, initiated_at:, additional_properties: nil)
              @check_id = check_id
              @status = status
              @initiated_at = initiated_at
              @additional_properties = additional_properties
              @_field_set = { "check_id": check_id, "status": status, "initiated_at": initiated_at }
            end

            # Deserialize a JSON object to an instance of LatestEligibilityCheck
            #
            # @param json_object [String]
            # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::LatestEligibilityCheck]
            def self.from_json(json_object:)
              struct = JSON.parse(json_object, object_class: OpenStruct)
              parsed_json = JSON.parse(json_object)
              check_id = struct["check_id"]
              status = struct["status"]
              initiated_at = (DateTime.parse(parsed_json["initiated_at"]) unless parsed_json["initiated_at"].nil?)
              new(
                check_id: check_id,
                status: status,
                initiated_at: initiated_at,
                additional_properties: struct
              )
            end

            # Serialize an instance of LatestEligibilityCheck to a JSON object
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
              obj.check_id.is_a?(String) != false || raise("Passed value for field obj.check_id is not the expected type, validation failed.")
              obj.status.is_a?(CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::EligibilityStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
              obj.initiated_at.is_a?(DateTime) != false || raise("Passed value for field obj.initiated_at is not the expected type, validation failed.")
            end
          end
        end
      end
    end
  end
end
