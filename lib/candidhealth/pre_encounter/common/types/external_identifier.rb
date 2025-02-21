# frozen_string_literal: true

require_relative "period"
require "ostruct"
require "json"

module CandidApiClient
  module PreEncounter
    module Common
      module Types
        # An external identifier for a patient
        class ExternalIdentifier
          # @return [String]
          attr_reader :value
          # @return [String]
          attr_reader :system
          # @return [CandidApiClient::PreEncounter::Common::Types::Period]
          attr_reader :period
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param value [String]
          # @param system [String]
          # @param period [CandidApiClient::PreEncounter::Common::Types::Period]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::PreEncounter::Common::Types::ExternalIdentifier]
          def initialize(value:, system:, period: OMIT, additional_properties: nil)
            @value = value
            @system = system
            @period = period if period != OMIT
            @additional_properties = additional_properties
            @_field_set = { "value": value, "system": system, "period": period }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of ExternalIdentifier
          #
          # @param json_object [String]
          # @return [CandidApiClient::PreEncounter::Common::Types::ExternalIdentifier]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            value = struct["value"]
            system = struct["system"]
            if parsed_json["period"].nil?
              period = nil
            else
              period = parsed_json["period"].to_json
              period = CandidApiClient::PreEncounter::Common::Types::Period.from_json(json_object: period)
            end
            new(
              value: value,
              system: system,
              period: period,
              additional_properties: struct
            )
          end

          # Serialize an instance of ExternalIdentifier to a JSON object
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
            obj.value.is_a?(String) != false || raise("Passed value for field obj.value is not the expected type, validation failed.")
            obj.system.is_a?(String) != false || raise("Passed value for field obj.system is not the expected type, validation failed.")
            obj.period.nil? || CandidApiClient::PreEncounter::Common::Types::Period.validate_raw(obj: obj.period)
          end
        end
      end
    end
  end
end
