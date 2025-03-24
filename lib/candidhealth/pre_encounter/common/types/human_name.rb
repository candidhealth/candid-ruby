# frozen_string_literal: true

require_relative "name_use"
require_relative "period"
require "ostruct"
require "json"

module CandidApiClient
  module PreEncounter
    module Common
      module Types
        class HumanName
          # @return [String]
          attr_reader :family
          # @return [Array<String>]
          attr_reader :given
          # @return [CandidApiClient::PreEncounter::Common::Types::NameUse]
          attr_reader :use
          # @return [CandidApiClient::PreEncounter::Common::Types::Period]
          attr_reader :period
          # @return [String]
          attr_reader :suffix
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param family [String]
          # @param given [Array<String>]
          # @param use [CandidApiClient::PreEncounter::Common::Types::NameUse]
          # @param period [CandidApiClient::PreEncounter::Common::Types::Period]
          # @param suffix [String]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::PreEncounter::Common::Types::HumanName]
          def initialize(family:, given:, use:, period: OMIT, suffix: OMIT, additional_properties: nil)
            @family = family
            @given = given
            @use = use
            @period = period if period != OMIT
            @suffix = suffix if suffix != OMIT
            @additional_properties = additional_properties
            @_field_set = {
              "family": family,
              "given": given,
              "use": use,
              "period": period,
              "suffix": suffix
            }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of HumanName
          #
          # @param json_object [String]
          # @return [CandidApiClient::PreEncounter::Common::Types::HumanName]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            family = struct["family"]
            given = struct["given"]
            use = struct["use"]
            if parsed_json["period"].nil?
              period = nil
            else
              period = parsed_json["period"].to_json
              period = CandidApiClient::PreEncounter::Common::Types::Period.from_json(json_object: period)
            end
            suffix = struct["suffix"]
            new(
              family: family,
              given: given,
              use: use,
              period: period,
              suffix: suffix,
              additional_properties: struct
            )
          end

          # Serialize an instance of HumanName to a JSON object
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
            obj.family.is_a?(String) != false || raise("Passed value for field obj.family is not the expected type, validation failed.")
            obj.given.is_a?(Array) != false || raise("Passed value for field obj.given is not the expected type, validation failed.")
            obj.use.is_a?(CandidApiClient::PreEncounter::Common::Types::NameUse) != false || raise("Passed value for field obj.use is not the expected type, validation failed.")
            obj.period.nil? || CandidApiClient::PreEncounter::Common::Types::Period.validate_raw(obj: obj.period)
            obj.suffix&.is_a?(String) != false || raise("Passed value for field obj.suffix is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
