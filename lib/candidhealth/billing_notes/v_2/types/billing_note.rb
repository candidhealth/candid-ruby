# frozen_string_literal: true

require_relative "billing_note_id"
require_relative "../../../commons/types/encounter_id"
require "date"
require "json"

module CandidApiClient
  module BillingNotes
    module V2
      class BillingNote
        attr_reader :billing_note_id, :encounter_id, :created_at, :author_auth_0_id, :author_name, :text,
                    :additional_properties

        # @param billing_note_id [BillingNotes::V2::BILLING_NOTE_ID]
        # @param encounter_id [Commons::ENCOUNTER_ID]
        # @param created_at [DateTime] An [RFC 3339, section 5.6 datetime](https://ijmacd.github.io/rfc3339-iso8601/).
        #   For example, 2017-07-21T17:32:28Z.
        # @param author_auth_0_id [String]
        # @param author_name [String]
        # @param text [String] Empty string not allowed.
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [BillingNotes::V2::BillingNote]
        def initialize(billing_note_id:, encounter_id:, created_at:, text:, author_auth_0_id: nil, author_name: nil,
                       additional_properties: nil)
          # @type [BillingNotes::V2::BILLING_NOTE_ID]
          @billing_note_id = billing_note_id
          # @type [Commons::ENCOUNTER_ID]
          @encounter_id = encounter_id
          # @type [DateTime] An [RFC 3339, section 5.6 datetime](https://ijmacd.github.io/rfc3339-iso8601/).
          #   For example, 2017-07-21T17:32:28Z.
          @created_at = created_at
          # @type [String]
          @author_auth_0_id = author_auth_0_id
          # @type [String]
          @author_name = author_name
          # @type [String] Empty string not allowed.
          @text = text
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of BillingNote
        #
        # @param json_object [JSON]
        # @return [BillingNotes::V2::BillingNote]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          parsed_json = JSON.parse(json_object)
          billing_note_id = struct.billing_note_id
          encounter_id = struct.encounter_id
          created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
          author_auth_0_id = struct.author_auth0_id
          author_name = struct.author_name
          text = struct.text
          new(billing_note_id: billing_note_id, encounter_id: encounter_id, created_at: created_at,
              author_auth_0_id: author_auth_0_id, author_name: author_name, text: text, additional_properties: struct)
        end

        # Serialize an instance of BillingNote to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          {
            "billing_note_id": @billing_note_id,
            "encounter_id": @encounter_id,
            "created_at": @created_at,
            "author_auth0_id": @author_auth_0_id,
            "author_name": @author_name,
            "text": @text
          }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          obj.billing_note_id.is_a?(String) != false || raise("Passed value for field obj.billing_note_id is not the expected type, validation failed.")
          obj.encounter_id.is_a?(String) != false || raise("Passed value for field obj.encounter_id is not the expected type, validation failed.")
          obj.created_at.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
          obj.author_auth_0_id&.is_a?(String) != false || raise("Passed value for field obj.author_auth_0_id is not the expected type, validation failed.")
          obj.author_name&.is_a?(String) != false || raise("Passed value for field obj.author_name is not the expected type, validation failed.")
          obj.text.is_a?(String) != false || raise("Passed value for field obj.text is not the expected type, validation failed.")
        end
      end
    end
  end
end
