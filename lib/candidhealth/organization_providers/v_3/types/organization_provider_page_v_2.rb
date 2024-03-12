# frozen_string_literal: true

require_relative "organization_provider_v_2"
require_relative "../../../commons/types/page_token"
require "json"

module CandidApiClient
  module OrganizationProviders
    module V3
      class OrganizationProviderPageV2
        attr_reader :items, :prev_page_token, :next_page_token, :additional_properties

        # @param items [Array<OrganizationProviders::V3::OrganizationProviderV2>]
        # @param prev_page_token [Commons::PAGE_TOKEN]
        # @param next_page_token [Commons::PAGE_TOKEN]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [OrganizationProviders::V3::OrganizationProviderPageV2]
        def initialize(items:, prev_page_token: nil, next_page_token: nil, additional_properties: nil)
          # @type [Array<OrganizationProviders::V3::OrganizationProviderV2>]
          @items = items
          # @type [Commons::PAGE_TOKEN]
          @prev_page_token = prev_page_token
          # @type [Commons::PAGE_TOKEN]
          @next_page_token = next_page_token
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of OrganizationProviderPageV2
        #
        # @param json_object [JSON]
        # @return [OrganizationProviders::V3::OrganizationProviderPageV2]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          parsed_json = JSON.parse(json_object)
          items = parsed_json["items"]&.map do |v|
            v = v.to_json
            OrganizationProviders::V3::OrganizationProviderV2.from_json(json_object: v)
          end
          prev_page_token = struct.prev_page_token
          next_page_token = struct.next_page_token
          new(items: items, prev_page_token: prev_page_token, next_page_token: next_page_token,
              additional_properties: struct)
        end

        # Serialize an instance of OrganizationProviderPageV2 to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          { "items": @items, "prev_page_token": @prev_page_token, "next_page_token": @next_page_token }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          obj.items.is_a?(Array) != false || raise("Passed value for field obj.items is not the expected type, validation failed.")
          obj.prev_page_token&.is_a?(String) != false || raise("Passed value for field obj.prev_page_token is not the expected type, validation failed.")
          obj.next_page_token&.is_a?(String) != false || raise("Passed value for field obj.next_page_token is not the expected type, validation failed.")
        end
      end
    end
  end
end
