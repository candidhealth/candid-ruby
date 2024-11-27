# frozen_string_literal: true

require "date"
require "ostruct"
require "json"

module CandidApiClient
  module PreEncounter
    module Common
      module Types
        class BaseModel
          # @return [String] The organization that owns this object.
          attr_reader :organization_id
          # @return [Boolean] True if the object is deactivated. Deactivated objects are not returned in
          #  search results but are returned in all other endpoints including scan.
          attr_reader :deactivated
          # @return [Integer] The version of the object. Any update to any property of an object object will
          #  create a new version.
          attr_reader :version
          # @return [DateTime]
          attr_reader :updated_at
          # @return [String] The user ID of the user who last updated the object.
          attr_reader :updating_user_id
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param organization_id [String] The organization that owns this object.
          # @param deactivated [Boolean] True if the object is deactivated. Deactivated objects are not returned in
          #  search results but are returned in all other endpoints including scan.
          # @param version [Integer] The version of the object. Any update to any property of an object object will
          #  create a new version.
          # @param updated_at [DateTime]
          # @param updating_user_id [String] The user ID of the user who last updated the object.
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::PreEncounter::Common::Types::BaseModel]
          def initialize(organization_id:, deactivated:, version:, updated_at:, updating_user_id:,
                         additional_properties: nil)
            @organization_id = organization_id
            @deactivated = deactivated
            @version = version
            @updated_at = updated_at
            @updating_user_id = updating_user_id
            @additional_properties = additional_properties
            @_field_set = {
              "organization_id": organization_id,
              "deactivated": deactivated,
              "version": version,
              "updated_at": updated_at,
              "updating_user_id": updating_user_id
            }
          end

          # Deserialize a JSON object to an instance of BaseModel
          #
          # @param json_object [String]
          # @return [CandidApiClient::PreEncounter::Common::Types::BaseModel]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            organization_id = struct["organization_id"]
            deactivated = struct["deactivated"]
            version = struct["version"]
            updated_at = (DateTime.parse(parsed_json["updated_at"]) unless parsed_json["updated_at"].nil?)
            updating_user_id = struct["updating_user_id"]
            new(
              organization_id: organization_id,
              deactivated: deactivated,
              version: version,
              updated_at: updated_at,
              updating_user_id: updating_user_id,
              additional_properties: struct
            )
          end

          # Serialize an instance of BaseModel to a JSON object
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
            obj.organization_id.is_a?(String) != false || raise("Passed value for field obj.organization_id is not the expected type, validation failed.")
            obj.deactivated.is_a?(Boolean) != false || raise("Passed value for field obj.deactivated is not the expected type, validation failed.")
            obj.version.is_a?(Integer) != false || raise("Passed value for field obj.version is not the expected type, validation failed.")
            obj.updated_at.is_a?(DateTime) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
            obj.updating_user_id.is_a?(String) != false || raise("Passed value for field obj.updating_user_id is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
