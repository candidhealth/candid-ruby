# frozen_string_literal: true

require_relative "admitting_diagnosis"
require "ostruct"
require "json"

module CandidApiClient
  module HealthCareCodeInformation
    module V1
      module Types
        class SetOrClearAdmittingDiagnosis
          # @return [CandidApiClient::HealthCareCodeInformation::V1::Types::AdmittingDiagnosis]
          attr_reader :value
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param value [CandidApiClient::HealthCareCodeInformation::V1::Types::AdmittingDiagnosis]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::HealthCareCodeInformation::V1::Types::SetOrClearAdmittingDiagnosis]
          def initialize(value: OMIT, additional_properties: nil)
            @value = value if value != OMIT
            @additional_properties = additional_properties
            @_field_set = { "value": value }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of SetOrClearAdmittingDiagnosis
          #
          # @param json_object [String]
          # @return [CandidApiClient::HealthCareCodeInformation::V1::Types::SetOrClearAdmittingDiagnosis]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            if parsed_json["value"].nil?
              value = nil
            else
              value = parsed_json["value"].to_json
              value = CandidApiClient::HealthCareCodeInformation::V1::Types::AdmittingDiagnosis.from_json(json_object: value)
            end
            new(value: value, additional_properties: struct)
          end

          # Serialize an instance of SetOrClearAdmittingDiagnosis to a JSON object
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
            obj.value.nil? || CandidApiClient::HealthCareCodeInformation::V1::Types::AdmittingDiagnosis.validate_raw(obj: obj.value)
          end
        end
      end
    end
  end
end
