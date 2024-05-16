# frozen_string_literal: true

require "json"

module CandidApiClient
  module Encounters
    module V4
      class Vitals
        attr_reader :height_in, :weight_lbs, :blood_pressure_systolic_mmhg, :blood_pressure_diastolic_mmhg,
                    :body_temperature_f, :additional_properties

        # @param height_in [Integer]
        # @param weight_lbs [Integer]
        # @param blood_pressure_systolic_mmhg [Integer]
        # @param blood_pressure_diastolic_mmhg [Integer]
        # @param body_temperature_f [Float]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [Encounters::V4::Vitals]
        def initialize(height_in: nil, weight_lbs: nil, blood_pressure_systolic_mmhg: nil,
                       blood_pressure_diastolic_mmhg: nil, body_temperature_f: nil, additional_properties: nil)
          # @type [Integer]
          @height_in = height_in
          # @type [Integer]
          @weight_lbs = weight_lbs
          # @type [Integer]
          @blood_pressure_systolic_mmhg = blood_pressure_systolic_mmhg
          # @type [Integer]
          @blood_pressure_diastolic_mmhg = blood_pressure_diastolic_mmhg
          # @type [Float]
          @body_temperature_f = body_temperature_f
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of Vitals
        #
        # @param json_object [JSON]
        # @return [Encounters::V4::Vitals]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          JSON.parse(json_object)
          height_in = struct.height_in
          weight_lbs = struct.weight_lbs
          blood_pressure_systolic_mmhg = struct.blood_pressure_systolic_mmhg
          blood_pressure_diastolic_mmhg = struct.blood_pressure_diastolic_mmhg
          body_temperature_f = struct.body_temperature_f
          new(height_in: height_in, weight_lbs: weight_lbs, blood_pressure_systolic_mmhg: blood_pressure_systolic_mmhg,
              blood_pressure_diastolic_mmhg: blood_pressure_diastolic_mmhg, body_temperature_f: body_temperature_f, additional_properties: struct)
        end

        # Serialize an instance of Vitals to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          {
            "height_in": @height_in,
            "weight_lbs": @weight_lbs,
            "blood_pressure_systolic_mmhg": @blood_pressure_systolic_mmhg,
            "blood_pressure_diastolic_mmhg": @blood_pressure_diastolic_mmhg,
            "body_temperature_f": @body_temperature_f
          }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
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
