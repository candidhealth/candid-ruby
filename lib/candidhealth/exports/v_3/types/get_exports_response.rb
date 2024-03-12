# frozen_string_literal: true

require "date"
require "json"

module CandidApiClient
  module Exports
    module V3
      class GetExportsResponse
        attr_reader :name, :created_at, :authenticated_download_url, :authenticated_download_url_expiration,
                    :additional_properties

        # @param name [String] Report name; contains date strings representing the start and end date of the export.
        # @param created_at [DateTime]
        # @param authenticated_download_url [String] Authenticated URL where a customer's report can be retrieved.
        # @param authenticated_download_url_expiration [DateTime] Expiration datetime of the authenticated URL. URLs expire after 2 minutes.
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [Exports::V3::GetExportsResponse]
        def initialize(name:, created_at:, authenticated_download_url:, authenticated_download_url_expiration:,
                       additional_properties: nil)
          # @type [String] Report name; contains date strings representing the start and end date of the export.
          @name = name
          # @type [DateTime]
          @created_at = created_at
          # @type [String] Authenticated URL where a customer's report can be retrieved.
          @authenticated_download_url = authenticated_download_url
          # @type [DateTime] Expiration datetime of the authenticated URL. URLs expire after 2 minutes.
          @authenticated_download_url_expiration = authenticated_download_url_expiration
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of GetExportsResponse
        #
        # @param json_object [JSON]
        # @return [Exports::V3::GetExportsResponse]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          parsed_json = JSON.parse(json_object)
          name = struct.name
          created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
          authenticated_download_url = struct.authenticated_download_url
          authenticated_download_url_expiration = unless parsed_json["authenticated_download_url_expiration"].nil?
                                                    DateTime.parse(parsed_json["authenticated_download_url_expiration"])
                                                  end
          new(name: name, created_at: created_at, authenticated_download_url: authenticated_download_url,
              authenticated_download_url_expiration: authenticated_download_url_expiration, additional_properties: struct)
        end

        # Serialize an instance of GetExportsResponse to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          {
            "name": @name,
            "created_at": @created_at,
            "authenticated_download_url": @authenticated_download_url,
            "authenticated_download_url_expiration": @authenticated_download_url_expiration
          }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
          obj.created_at.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
          obj.authenticated_download_url.is_a?(String) != false || raise("Passed value for field obj.authenticated_download_url is not the expected type, validation failed.")
          obj.authenticated_download_url_expiration.is_a?(DateTime) != false || raise("Passed value for field obj.authenticated_download_url_expiration is not the expected type, validation failed.")
        end
      end
    end
  end
end
