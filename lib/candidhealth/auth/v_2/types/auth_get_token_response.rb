# frozen_string_literal: true

require "json"

module CandidApiClient
  module Auth
    module V2
      class AuthGetTokenResponse
        attr_reader :access_token, :expires_in, :token_type, :additional_properties

        # @param access_token [String]
        # @param expires_in [Integer] Time in seconds.
        # @param token_type [String]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [Auth::V2::AuthGetTokenResponse]
        def initialize(access_token:, expires_in:, token_type:, additional_properties: nil)
          # @type [String]
          @access_token = access_token
          # @type [Integer] Time in seconds.
          @expires_in = expires_in
          # @type [String]
          @token_type = token_type
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of AuthGetTokenResponse
        #
        # @param json_object [JSON]
        # @return [Auth::V2::AuthGetTokenResponse]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          JSON.parse(json_object)
          access_token = struct.access_token
          expires_in = struct.expires_in
          token_type = struct.token_type
          new(access_token: access_token, expires_in: expires_in, token_type: token_type, additional_properties: struct)
        end

        # Serialize an instance of AuthGetTokenResponse to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          { "access_token": @access_token, "expires_in": @expires_in, "token_type": @token_type }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          obj.access_token.is_a?(String) != false || raise("Passed value for field obj.access_token is not the expected type, validation failed.")
          obj.expires_in.is_a?(Integer) != false || raise("Passed value for field obj.expires_in is not the expected type, validation failed.")
          obj.token_type.is_a?(String) != false || raise("Passed value for field obj.token_type is not the expected type, validation failed.")
        end
      end
    end
  end
end
