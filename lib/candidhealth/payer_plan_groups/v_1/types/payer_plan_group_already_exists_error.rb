# frozen_string_literal: true

require "ostruct"
require "json"

module CandidApiClient
  module PayerPlanGroups
    module V1
      module Types
        class PayerPlanGroupAlreadyExistsError
          # @return [String]
          attr_reader :message
          # @return [String]
          attr_reader :id
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param message [String]
          # @param id [String]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::PayerPlanGroups::V1::Types::PayerPlanGroupAlreadyExistsError]
          def initialize(message:, id:, additional_properties: nil)
            @message = message
            @id = id
            @additional_properties = additional_properties
            @_field_set = { "message": message, "id": id }
          end

          # Deserialize a JSON object to an instance of PayerPlanGroupAlreadyExistsError
          #
          # @param json_object [String]
          # @return [CandidApiClient::PayerPlanGroups::V1::Types::PayerPlanGroupAlreadyExistsError]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            message = struct["message"]
            id = struct["id"]
            new(
              message: message,
              id: id,
              additional_properties: struct
            )
          end

          # Serialize an instance of PayerPlanGroupAlreadyExistsError to a JSON object
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
            obj.message.is_a?(String) != false || raise("Passed value for field obj.message is not the expected type, validation failed.")
            obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
