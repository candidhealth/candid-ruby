# frozen_string_literal: true

require "json"

module CandidApiClient
  module Auth
    module V2
      class AuthGetTokenRequest
        attr_reader :client_id, :client_secret, :additional_properties

        # @param client_id [String] Your application's Client ID.
        # @param client_secret [String] Your application's Client Secret.
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [Auth::V2::AuthGetTokenRequest]
        def initialize(client_id:, client_secret:, additional_properties: nil)
          # @type [String] Your application's Client ID.
          @client_id = client_id
          # @type [String] Your application's Client Secret.
          @client_secret = client_secret
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of AuthGetTokenRequest
        #
        # @param json_object [JSON]
        # @return [Auth::V2::AuthGetTokenRequest]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          JSON.parse(json_object)
          client_id = struct.client_id
          client_secret = struct.client_secret
          new(client_id: client_id, client_secret: client_secret, additional_properties: struct)
        end

        # Serialize an instance of AuthGetTokenRequest to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          { "client_id": @client_id, "client_secret": @client_secret }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          obj.client_id.is_a?(String) != false || raise("Passed value for field obj.client_id is not the expected type, validation failed.")
          obj.client_secret.is_a?(String) != false || raise("Passed value for field obj.client_secret is not the expected type, validation failed.")
        end
      end
    end
  end
end
