# frozen_string_literal: true

require "ostruct"
require "json"

module CandidApiClient
  module NonInsurancePayers
    module V1
      module Types
        class NonInsurancePayer
          # @return [String]
          attr_reader :non_insurance_payer_id
          # @return [String]
          attr_reader :name
          # @return [String]
          attr_reader :description
          # @return [String]
          attr_reader :category
          # @return [Boolean]
          attr_reader :enabled
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param non_insurance_payer_id [String]
          # @param name [String]
          # @param description [String]
          # @param category [String]
          # @param enabled [Boolean]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::NonInsurancePayers::V1::Types::NonInsurancePayer]
          def initialize(non_insurance_payer_id:, name:, enabled:, description: OMIT, category: OMIT,
                         additional_properties: nil)
            @non_insurance_payer_id = non_insurance_payer_id
            @name = name
            @description = description if description != OMIT
            @category = category if category != OMIT
            @enabled = enabled
            @additional_properties = additional_properties
            @_field_set = {
              "non_insurance_payer_id": non_insurance_payer_id,
              "name": name,
              "description": description,
              "category": category,
              "enabled": enabled
            }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of NonInsurancePayer
          #
          # @param json_object [String]
          # @return [CandidApiClient::NonInsurancePayers::V1::Types::NonInsurancePayer]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            non_insurance_payer_id = struct["non_insurance_payer_id"]
            name = struct["name"]
            description = struct["description"]
            category = struct["category"]
            enabled = struct["enabled"]
            new(
              non_insurance_payer_id: non_insurance_payer_id,
              name: name,
              description: description,
              category: category,
              enabled: enabled,
              additional_properties: struct
            )
          end

          # Serialize an instance of NonInsurancePayer to a JSON object
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
            obj.non_insurance_payer_id.is_a?(String) != false || raise("Passed value for field obj.non_insurance_payer_id is not the expected type, validation failed.")
            obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
            obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
            obj.category&.is_a?(String) != false || raise("Passed value for field obj.category is not the expected type, validation failed.")
            obj.enabled.is_a?(Boolean) != false || raise("Passed value for field obj.enabled is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
