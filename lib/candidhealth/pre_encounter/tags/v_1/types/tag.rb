# frozen_string_literal: true

require "date"
require "ostruct"
require "json"

module CandidApiClient
  module PreEncounter
    module Tags
      module V1
        module Types
          # A Tag object with immutable server-owned properties.
          class Tag
            # @return [String]
            attr_reader :id
            # @return [String] The organization that owns this object.
            attr_reader :organization_id
            # @return [Boolean] True if the object is deactivated.  Deactivated objects are not returned in
            #  search results but are returned in all other endpoints including scan.
            attr_reader :deactivated
            # @return [Integer] The version of the object. Any update to any property of an object object will
            #  create a new version.
            attr_reader :version
            # @return [DateTime]
            attr_reader :updated_at
            # @return [String] The user ID of the user who last updated the object.
            attr_reader :updating_user_id
            # @return [String]
            attr_reader :value
            # @return [String]
            attr_reader :description
            # @return [Boolean]
            attr_reader :alert
            # @return [OpenStruct] Additional properties unmapped to the current class definition
            attr_reader :additional_properties
            # @return [Object]
            attr_reader :_field_set
            protected :_field_set

            OMIT = Object.new

            # @param id [String]
            # @param organization_id [String] The organization that owns this object.
            # @param deactivated [Boolean] True if the object is deactivated.  Deactivated objects are not returned in
            #  search results but are returned in all other endpoints including scan.
            # @param version [Integer] The version of the object. Any update to any property of an object object will
            #  create a new version.
            # @param updated_at [DateTime]
            # @param updating_user_id [String] The user ID of the user who last updated the object.
            # @param value [String]
            # @param description [String]
            # @param alert [Boolean]
            # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
            # @return [CandidApiClient::PreEncounter::Tags::V1::Types::Tag]
            def initialize(id:, organization_id:, deactivated:, version:, updated_at:, updating_user_id:, value:,
                           description: OMIT, alert: OMIT, additional_properties: nil)
              @id = id
              @organization_id = organization_id
              @deactivated = deactivated
              @version = version
              @updated_at = updated_at
              @updating_user_id = updating_user_id
              @value = value
              @description = description if description != OMIT
              @alert = alert if alert != OMIT
              @additional_properties = additional_properties
              @_field_set = {
                "id": id,
                "organization_id": organization_id,
                "deactivated": deactivated,
                "version": version,
                "updated_at": updated_at,
                "updating_user_id": updating_user_id,
                "value": value,
                "description": description,
                "alert": alert
              }.reject do |_k, v|
                v == OMIT
              end
            end

            # Deserialize a JSON object to an instance of Tag
            #
            # @param json_object [String]
            # @return [CandidApiClient::PreEncounter::Tags::V1::Types::Tag]
            def self.from_json(json_object:)
              struct = JSON.parse(json_object, object_class: OpenStruct)
              parsed_json = JSON.parse(json_object)
              id = struct["id"]
              organization_id = struct["organization_id"]
              deactivated = struct["deactivated"]
              version = struct["version"]
              updated_at = (DateTime.parse(parsed_json["updated_at"]) unless parsed_json["updated_at"].nil?)
              updating_user_id = struct["updating_user_id"]
              value = struct["value"]
              description = struct["description"]
              alert = struct["alert"]
              new(
                id: id,
                organization_id: organization_id,
                deactivated: deactivated,
                version: version,
                updated_at: updated_at,
                updating_user_id: updating_user_id,
                value: value,
                description: description,
                alert: alert,
                additional_properties: struct
              )
            end

            # Serialize an instance of Tag to a JSON object
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
              obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
              obj.organization_id.is_a?(String) != false || raise("Passed value for field obj.organization_id is not the expected type, validation failed.")
              obj.deactivated.is_a?(Boolean) != false || raise("Passed value for field obj.deactivated is not the expected type, validation failed.")
              obj.version.is_a?(Integer) != false || raise("Passed value for field obj.version is not the expected type, validation failed.")
              obj.updated_at.is_a?(DateTime) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
              obj.updating_user_id.is_a?(String) != false || raise("Passed value for field obj.updating_user_id is not the expected type, validation failed.")
              obj.value.is_a?(String) != false || raise("Passed value for field obj.value is not the expected type, validation failed.")
              obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
              obj.alert&.is_a?(Boolean) != false || raise("Passed value for field obj.alert is not the expected type, validation failed.")
            end
          end
        end
      end
    end
  end
end
