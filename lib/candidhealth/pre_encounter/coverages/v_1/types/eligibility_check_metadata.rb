# frozen_string_literal: true

require_relative "service_type_code"
require_relative "eligibility_check_status"
require "date"
require "ostruct"
require "json"

module CandidApiClient
  module PreEncounter
    module Coverages
      module V1
        module Types
          class EligibilityCheckMetadata
            # @return [String]
            attr_reader :check_id
            # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::ServiceTypeCode]
            attr_reader :service_code
            # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::EligibilityCheckStatus]
            attr_reader :status
            # @return [String]
            attr_reader :initiated_by
            # @return [DateTime]
            attr_reader :initiated_at
            # @return [OpenStruct] Additional properties unmapped to the current class definition
            attr_reader :additional_properties
            # @return [Object]
            attr_reader :_field_set
            protected :_field_set

            OMIT = Object.new

            # @param check_id [String]
            # @param service_code [CandidApiClient::PreEncounter::Coverages::V1::Types::ServiceTypeCode]
            # @param status [CandidApiClient::PreEncounter::Coverages::V1::Types::EligibilityCheckStatus]
            # @param initiated_by [String]
            # @param initiated_at [DateTime]
            # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
            # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::EligibilityCheckMetadata]
            def initialize(check_id:, service_code:, status:, initiated_by:, initiated_at:, additional_properties: nil)
              @check_id = check_id
              @service_code = service_code
              @status = status
              @initiated_by = initiated_by
              @initiated_at = initiated_at
              @additional_properties = additional_properties
              @_field_set = {
                "check_id": check_id,
                "service_code": service_code,
                "status": status,
                "initiated_by": initiated_by,
                "initiated_at": initiated_at
              }
            end

            # Deserialize a JSON object to an instance of EligibilityCheckMetadata
            #
            # @param json_object [String]
            # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::EligibilityCheckMetadata]
            def self.from_json(json_object:)
              struct = JSON.parse(json_object, object_class: OpenStruct)
              parsed_json = JSON.parse(json_object)
              check_id = struct["check_id"]
              service_code = struct["service_code"]
              status = struct["status"]
              initiated_by = struct["initiated_by"]
              initiated_at = (DateTime.parse(parsed_json["initiated_at"]) unless parsed_json["initiated_at"].nil?)
              new(
                check_id: check_id,
                service_code: service_code,
                status: status,
                initiated_by: initiated_by,
                initiated_at: initiated_at,
                additional_properties: struct
              )
            end

            # Serialize an instance of EligibilityCheckMetadata to a JSON object
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
              obj.service_code.is_a?(CandidApiClient::PreEncounter::Coverages::V1::Types::ServiceTypeCode) != false || raise("Passed value for field obj.service_code is not the expected type, validation failed.")
              obj.status.is_a?(CandidApiClient::PreEncounter::Coverages::V1::Types::EligibilityCheckStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
              obj.initiated_by.is_a?(String) != false || raise("Passed value for field obj.initiated_by is not the expected type, validation failed.")
              obj.initiated_at.is_a?(DateTime) != false || raise("Passed value for field obj.initiated_at is not the expected type, validation failed.")
            end
          end
        end
      end
    end
  end
end
