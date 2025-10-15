# frozen_string_literal: true

require_relative "principal_procedure_information_code_qualifier"
require "date"
require "ostruct"
require "json"

module CandidApiClient
  module HealthCareCodeInformation
    module V1
      module Types
        # This correspond to BBR, BR, and CAH code qualifier values.
        class PrincipalProcedureInformation
          # @return [CandidApiClient::HealthCareCodeInformation::V1::Types::PrincipalProcedureInformationCodeQualifier]
          attr_reader :principal_procedure_code_qualifier
          # @return [String]
          attr_reader :principal_procedure_code
          # @return [DateTime] An [RFC 3339, section 5.6 datetime](https://ijmacd.github.io/rfc3339-iso8601/).
          #  For example, 2017-07-21T17:32:28Z.
          #  In practice, only the date portion of this is used for claim submission, so
          #  midnight time is fine.
          attr_reader :procedure_date
          # @return [String] The id of this health care code information if it is already stored.
          #  If this is not set, this is referring to a new health care code information to
          #  be added
          #  to the encounter.  If it is set, this refers to an update of an existing health
          #  care code
          #  information object on the encounter.
          attr_reader :id
          # @return [String] The encounter_id of this health care code information if it is already stored.
          #  This will be set by the server in responses, but clients are not expected to set
          #  it.
          attr_reader :encounter_id
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param principal_procedure_code_qualifier [CandidApiClient::HealthCareCodeInformation::V1::Types::PrincipalProcedureInformationCodeQualifier]
          # @param principal_procedure_code [String]
          # @param procedure_date [DateTime] An [RFC 3339, section 5.6 datetime](https://ijmacd.github.io/rfc3339-iso8601/).
          #  For example, 2017-07-21T17:32:28Z.
          #  In practice, only the date portion of this is used for claim submission, so
          #  midnight time is fine.
          # @param id [String] The id of this health care code information if it is already stored.
          #  If this is not set, this is referring to a new health care code information to
          #  be added
          #  to the encounter.  If it is set, this refers to an update of an existing health
          #  care code
          #  information object on the encounter.
          # @param encounter_id [String] The encounter_id of this health care code information if it is already stored.
          #  This will be set by the server in responses, but clients are not expected to set
          #  it.
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::HealthCareCodeInformation::V1::Types::PrincipalProcedureInformation]
          def initialize(principal_procedure_code_qualifier:, principal_procedure_code:, procedure_date:, id: OMIT,
                         encounter_id: OMIT, additional_properties: nil)
            @principal_procedure_code_qualifier = principal_procedure_code_qualifier
            @principal_procedure_code = principal_procedure_code
            @procedure_date = procedure_date
            @id = id if id != OMIT
            @encounter_id = encounter_id if encounter_id != OMIT
            @additional_properties = additional_properties
            @_field_set = {
              "principal_procedure_code_qualifier": principal_procedure_code_qualifier,
              "principal_procedure_code": principal_procedure_code,
              "procedure_date": procedure_date,
              "id": id,
              "encounter_id": encounter_id
            }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of PrincipalProcedureInformation
          #
          # @param json_object [String]
          # @return [CandidApiClient::HealthCareCodeInformation::V1::Types::PrincipalProcedureInformation]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            principal_procedure_code_qualifier = struct["principal_procedure_code_qualifier"]
            principal_procedure_code = struct["principal_procedure_code"]
            procedure_date = (DateTime.parse(parsed_json["procedure_date"]) unless parsed_json["procedure_date"].nil?)
            id = struct["id"]
            encounter_id = struct["encounter_id"]
            new(
              principal_procedure_code_qualifier: principal_procedure_code_qualifier,
              principal_procedure_code: principal_procedure_code,
              procedure_date: procedure_date,
              id: id,
              encounter_id: encounter_id,
              additional_properties: struct
            )
          end

          # Serialize an instance of PrincipalProcedureInformation to a JSON object
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
            obj.principal_procedure_code_qualifier.is_a?(CandidApiClient::HealthCareCodeInformation::V1::Types::PrincipalProcedureInformationCodeQualifier) != false || raise("Passed value for field obj.principal_procedure_code_qualifier is not the expected type, validation failed.")
            obj.principal_procedure_code.is_a?(String) != false || raise("Passed value for field obj.principal_procedure_code is not the expected type, validation failed.")
            obj.procedure_date.is_a?(DateTime) != false || raise("Passed value for field obj.procedure_date is not the expected type, validation failed.")
            obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
            obj.encounter_id&.is_a?(String) != false || raise("Passed value for field obj.encounter_id is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
