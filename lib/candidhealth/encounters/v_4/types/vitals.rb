# frozen_string_literal: true

require "ostruct"
require "json"

module CandidApiClient
  module Encounters
    module V4
      module Types
        class Vitals
          # @return [Integer]
          attr_reader :height_in
          # @return [Integer]
          attr_reader :weight_lbs
          # @return [Integer]
          attr_reader :blood_pressure_systolic_mmhg
          # @return [Integer]
          attr_reader :blood_pressure_diastolic_mmhg
          # @return [Float]
          attr_reader :body_temperature_f
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param height_in [Integer]
          # @param weight_lbs [Integer]
          # @param blood_pressure_systolic_mmhg [Integer]
          # @param blood_pressure_diastolic_mmhg [Integer]
          # @param body_temperature_f [Float]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::Encounters::V4::Types::Vitals]
          def initialize(height_in: OMIT, weight_lbs: OMIT, blood_pressure_systolic_mmhg: OMIT,
                         blood_pressure_diastolic_mmhg: OMIT, body_temperature_f: OMIT, additional_properties: nil)
            @height_in = height_in if height_in != OMIT
            @weight_lbs = weight_lbs if weight_lbs != OMIT
            @blood_pressure_systolic_mmhg = blood_pressure_systolic_mmhg if blood_pressure_systolic_mmhg != OMIT
            @blood_pressure_diastolic_mmhg = blood_pressure_diastolic_mmhg if blood_pressure_diastolic_mmhg != OMIT
            @body_temperature_f = body_temperature_f if body_temperature_f != OMIT
            @additional_properties = additional_properties
            @_field_set = {
              "height_in": height_in,
              "weight_lbs": weight_lbs,
              "blood_pressure_systolic_mmhg": blood_pressure_systolic_mmhg,
              "blood_pressure_diastolic_mmhg": blood_pressure_diastolic_mmhg,
              "body_temperature_f": body_temperature_f
            }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of Vitals
          #
          # @param json_object [String]
          # @return [CandidApiClient::Encounters::V4::Types::Vitals]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            height_in = struct["height_in"]
            weight_lbs = struct["weight_lbs"]
            blood_pressure_systolic_mmhg = struct["blood_pressure_systolic_mmhg"]
            blood_pressure_diastolic_mmhg = struct["blood_pressure_diastolic_mmhg"]
            body_temperature_f = struct["body_temperature_f"]
            new(
              height_in: height_in,
              weight_lbs: weight_lbs,
              blood_pressure_systolic_mmhg: blood_pressure_systolic_mmhg,
              blood_pressure_diastolic_mmhg: blood_pressure_diastolic_mmhg,
              body_temperature_f: body_temperature_f,
              additional_properties: struct
            )
          end

          # Serialize an instance of Vitals to a JSON object
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
            obj.height_in&.is_a?(Integer) != false || raise("Passed value for field obj.height_in is not the expected type, validation failed.")
            obj.weight_lbs&.is_a?(Integer) != false || raise("Passed value for field obj.weight_lbs is not the expected type, validation failed.")
            obj.blood_pressure_systolic_mmhg&.is_a?(Integer) != false || raise("Passed value for field obj.blood_pressure_systolic_mmhg is not the expected type, validation failed.")
            obj.blood_pressure_diastolic_mmhg&.is_a?(Integer) != false || raise("Passed value for field obj.blood_pressure_diastolic_mmhg is not the expected type, validation failed.")
            obj.body_temperature_f&.is_a?(Float) != false || raise("Passed value for field obj.body_temperature_f is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
