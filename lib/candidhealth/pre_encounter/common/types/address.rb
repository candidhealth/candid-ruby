# frozen_string_literal: true

require_relative "address_use"
require_relative "period"
require "ostruct"
require "json"

module CandidApiClient
  module PreEncounter
    module Common
      module Types
        class Address
          # @return [CandidApiClient::PreEncounter::Common::Types::AddressUse]
          attr_reader :use
          # @return [Array<String>]
          attr_reader :line
          # @return [String]
          attr_reader :city
          # @return [String]
          attr_reader :state
          # @return [String]
          attr_reader :postal_code
          # @return [String]
          attr_reader :country
          # @return [CandidApiClient::PreEncounter::Common::Types::Period]
          attr_reader :period
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param use [CandidApiClient::PreEncounter::Common::Types::AddressUse]
          # @param line [Array<String>]
          # @param city [String]
          # @param state [String]
          # @param postal_code [String]
          # @param country [String]
          # @param period [CandidApiClient::PreEncounter::Common::Types::Period]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::PreEncounter::Common::Types::Address]
          def initialize(use:, line:, city:, state:, postal_code:, country:, period: OMIT, additional_properties: nil)
            @use = use
            @line = line
            @city = city
            @state = state
            @postal_code = postal_code
            @country = country
            @period = period if period != OMIT
            @additional_properties = additional_properties
            @_field_set = {
              "use": use,
              "line": line,
              "city": city,
              "state": state,
              "postalCode": postal_code,
              "country": country,
              "period": period
            }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of Address
          #
          # @param json_object [String]
          # @return [CandidApiClient::PreEncounter::Common::Types::Address]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            use = struct["use"]
            line = struct["line"]
            city = struct["city"]
            state = struct["state"]
            postal_code = struct["postalCode"]
            country = struct["country"]
            if parsed_json["period"].nil?
              period = nil
            else
              period = parsed_json["period"].to_json
              period = CandidApiClient::PreEncounter::Common::Types::Period.from_json(json_object: period)
            end
            new(
              use: use,
              line: line,
              city: city,
              state: state,
              postal_code: postal_code,
              country: country,
              period: period,
              additional_properties: struct
            )
          end

          # Serialize an instance of Address to a JSON object
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
            obj.use.is_a?(CandidApiClient::PreEncounter::Common::Types::AddressUse) != false || raise("Passed value for field obj.use is not the expected type, validation failed.")
            obj.line.is_a?(Array) != false || raise("Passed value for field obj.line is not the expected type, validation failed.")
            obj.city.is_a?(String) != false || raise("Passed value for field obj.city is not the expected type, validation failed.")
            obj.state.is_a?(String) != false || raise("Passed value for field obj.state is not the expected type, validation failed.")
            obj.postal_code.is_a?(String) != false || raise("Passed value for field obj.postal_code is not the expected type, validation failed.")
            obj.country.is_a?(String) != false || raise("Passed value for field obj.country is not the expected type, validation failed.")
            obj.period.nil? || CandidApiClient::PreEncounter::Common::Types::Period.validate_raw(obj: obj.period)
          end
        end
      end
    end
  end
end
