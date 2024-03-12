# frozen_string_literal: true

require "json"

module CandidApiClient
  module BillingNotes
    module V2
      class BillingNoteBase
        attr_reader :text, :additional_properties

        # @param text [String] Empty string not allowed.
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [BillingNotes::V2::BillingNoteBase]
        def initialize(text:, additional_properties: nil)
          # @type [String] Empty string not allowed.
          @text = text
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of BillingNoteBase
        #
        # @param json_object [JSON]
        # @return [BillingNotes::V2::BillingNoteBase]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          JSON.parse(json_object)
          text = struct.text
          new(text: text, additional_properties: struct)
        end

        # Serialize an instance of BillingNoteBase to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          { "text": @text }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          obj.text.is_a?(String) != false || raise("Passed value for field obj.text is not the expected type, validation failed.")
        end
      end
    end
  end
end
