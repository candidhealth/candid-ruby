# frozen_string_literal: true

require "ostruct"
require "json"

module CandidApiClient
  module PreEncounter
    module EligibilityChecks
      module V1
        module Types
          # An object representing the payload for a Medicare Advantage recommendation.
          class MedicareAdvantageRecommendationPayload
            # @return [String]
            attr_reader :payer_id
            # @return [String]
            attr_reader :payer_name
            # @return [String]
            attr_reader :member_id
            # @return [OpenStruct] Additional properties unmapped to the current class definition
            attr_reader :additional_properties
            # @return [Object]
            attr_reader :_field_set
            protected :_field_set

            OMIT = Object.new

            # @param payer_id [String]
            # @param payer_name [String]
            # @param member_id [String]
            # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
            # @return [CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::MedicareAdvantageRecommendationPayload]
            def initialize(payer_id:, payer_name:, member_id: OMIT, additional_properties: nil)
              @payer_id = payer_id
              @payer_name = payer_name
              @member_id = member_id if member_id != OMIT
              @additional_properties = additional_properties
              @_field_set = {
                "payer_id": payer_id,
                "payer_name": payer_name,
                "member_id": member_id
              }.reject do |_k, v|
                v == OMIT
              end
            end

            # Deserialize a JSON object to an instance of
            #  MedicareAdvantageRecommendationPayload
            #
            # @param json_object [String]
            # @return [CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::MedicareAdvantageRecommendationPayload]
            def self.from_json(json_object:)
              struct = JSON.parse(json_object, object_class: OpenStruct)
              payer_id = struct["payer_id"]
              payer_name = struct["payer_name"]
              member_id = struct["member_id"]
              new(
                payer_id: payer_id,
                payer_name: payer_name,
                member_id: member_id,
                additional_properties: struct
              )
            end

            # Serialize an instance of MedicareAdvantageRecommendationPayload to a JSON object
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
              obj.payer_id.is_a?(String) != false || raise("Passed value for field obj.payer_id is not the expected type, validation failed.")
              obj.payer_name.is_a?(String) != false || raise("Passed value for field obj.payer_name is not the expected type, validation failed.")
              obj.member_id&.is_a?(String) != false || raise("Passed value for field obj.member_id is not the expected type, validation failed.")
            end
          end
        end
      end
    end
  end
end
