# frozen_string_literal: true

require "date"
require "ostruct"
require "json"

module CandidApiClient
  module BillingNotes
    module V2
      module Types
        class BillingNoteOptional
          # @return [String]
          attr_reader :billing_note_id
          # @return [String]
          attr_reader :encounter_id
          # @return [DateTime] An [RFC 3339, section 5.6 datetime](https://ijmacd.github.io/rfc3339-iso8601/).
          #  For example, 2017-07-21T17:32:28Z.
          attr_reader :created_at
          # @return [String]
          attr_reader :author_auth_0_id
          # @return [String]
          attr_reader :author_name
          # @return [String] Empty string not allowed.
          attr_reader :text
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param billing_note_id [String]
          # @param encounter_id [String]
          # @param created_at [DateTime] An [RFC 3339, section 5.6 datetime](https://ijmacd.github.io/rfc3339-iso8601/).
          #  For example, 2017-07-21T17:32:28Z.
          # @param author_auth_0_id [String]
          # @param author_name [String]
          # @param text [String] Empty string not allowed.
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::BillingNotes::V2::Types::BillingNoteOptional]
          def initialize(billing_note_id:, created_at:, text:, encounter_id: OMIT, author_auth_0_id: OMIT,
                         author_name: OMIT, additional_properties: nil)
            @billing_note_id = billing_note_id
            @encounter_id = encounter_id if encounter_id != OMIT
            @created_at = created_at
            @author_auth_0_id = author_auth_0_id if author_auth_0_id != OMIT
            @author_name = author_name if author_name != OMIT
            @text = text
            @additional_properties = additional_properties
            @_field_set = {
              "billing_note_id": billing_note_id,
              "encounter_id": encounter_id,
              "created_at": created_at,
              "author_auth0_id": author_auth_0_id,
              "author_name": author_name,
              "text": text
            }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of BillingNoteOptional
          #
          # @param json_object [String]
          # @return [CandidApiClient::BillingNotes::V2::Types::BillingNoteOptional]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            billing_note_id = struct["billing_note_id"]
            encounter_id = struct["encounter_id"]
            created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
            author_auth_0_id = struct["author_auth0_id"]
            author_name = struct["author_name"]
            text = struct["text"]
            new(
              billing_note_id: billing_note_id,
              encounter_id: encounter_id,
              created_at: created_at,
              author_auth_0_id: author_auth_0_id,
              author_name: author_name,
              text: text,
              additional_properties: struct
            )
          end

          # Serialize an instance of BillingNoteOptional to a JSON object
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
            obj.billing_note_id.is_a?(String) != false || raise("Passed value for field obj.billing_note_id is not the expected type, validation failed.")
            obj.encounter_id&.is_a?(String) != false || raise("Passed value for field obj.encounter_id is not the expected type, validation failed.")
            obj.created_at.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
            obj.author_auth_0_id&.is_a?(String) != false || raise("Passed value for field obj.author_auth_0_id is not the expected type, validation failed.")
            obj.author_name&.is_a?(String) != false || raise("Passed value for field obj.author_name is not the expected type, validation failed.")
            obj.text.is_a?(String) != false || raise("Passed value for field obj.text is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
