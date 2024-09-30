# frozen_string_literal: true

require "ostruct"
require "json"

module CandidApiClient
  module PreEncounter
    module Common
      module Types
        class AdditionalPayerInformation
          # @return [String]
          attr_reader :availity_eligibility_id
          # @return [String]
          attr_reader :availity_payer_id
          # @return [String]
          attr_reader :availity_payer_name
          # @return [String]
          attr_reader :availity_remittance_payer_id
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param availity_eligibility_id [String]
          # @param availity_payer_id [String]
          # @param availity_payer_name [String]
          # @param availity_remittance_payer_id [String]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::PreEncounter::Common::Types::AdditionalPayerInformation]
          def initialize(availity_eligibility_id: OMIT, availity_payer_id: OMIT, availity_payer_name: OMIT,
                         availity_remittance_payer_id: OMIT, additional_properties: nil)
            @availity_eligibility_id = availity_eligibility_id if availity_eligibility_id != OMIT
            @availity_payer_id = availity_payer_id if availity_payer_id != OMIT
            @availity_payer_name = availity_payer_name if availity_payer_name != OMIT
            @availity_remittance_payer_id = availity_remittance_payer_id if availity_remittance_payer_id != OMIT
            @additional_properties = additional_properties
            @_field_set = {
              "availity_eligibility_id": availity_eligibility_id,
              "availity_payer_id": availity_payer_id,
              "availity_payer_name": availity_payer_name,
              "availity_remittance_payer_id": availity_remittance_payer_id
            }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of AdditionalPayerInformation
          #
          # @param json_object [String]
          # @return [CandidApiClient::PreEncounter::Common::Types::AdditionalPayerInformation]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            availity_eligibility_id = struct["availity_eligibility_id"]
            availity_payer_id = struct["availity_payer_id"]
            availity_payer_name = struct["availity_payer_name"]
            availity_remittance_payer_id = struct["availity_remittance_payer_id"]
            new(
              availity_eligibility_id: availity_eligibility_id,
              availity_payer_id: availity_payer_id,
              availity_payer_name: availity_payer_name,
              availity_remittance_payer_id: availity_remittance_payer_id,
              additional_properties: struct
            )
          end

          # Serialize an instance of AdditionalPayerInformation to a JSON object
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
            obj.availity_eligibility_id&.is_a?(String) != false || raise("Passed value for field obj.availity_eligibility_id is not the expected type, validation failed.")
            obj.availity_payer_id&.is_a?(String) != false || raise("Passed value for field obj.availity_payer_id is not the expected type, validation failed.")
            obj.availity_payer_name&.is_a?(String) != false || raise("Passed value for field obj.availity_payer_name is not the expected type, validation failed.")
            obj.availity_remittance_payer_id&.is_a?(String) != false || raise("Passed value for field obj.availity_remittance_payer_id is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
