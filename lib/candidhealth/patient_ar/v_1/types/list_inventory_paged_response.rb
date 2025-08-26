# frozen_string_literal: true

require_relative "inventory_record"
require "ostruct"
require "json"

module CandidApiClient
  module PatientAr
    module V1
      module Types
        class ListInventoryPagedResponse
          # @return [Array<CandidApiClient::PatientAr::V1::Types::InventoryRecord>] List of inventory records matching the filters
          attr_reader :records
          # @return [String] Token for the next page of results, if available
          attr_reader :next_page_token
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param records [Array<CandidApiClient::PatientAr::V1::Types::InventoryRecord>] List of inventory records matching the filters
          # @param next_page_token [String] Token for the next page of results, if available
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::PatientAr::V1::Types::ListInventoryPagedResponse]
          def initialize(records:, next_page_token: OMIT, additional_properties: nil)
            @records = records
            @next_page_token = next_page_token if next_page_token != OMIT
            @additional_properties = additional_properties
            @_field_set = { "records": records, "next_page_token": next_page_token }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of ListInventoryPagedResponse
          #
          # @param json_object [String]
          # @return [CandidApiClient::PatientAr::V1::Types::ListInventoryPagedResponse]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            records = parsed_json["records"]&.map do |item|
              item = item.to_json
              CandidApiClient::PatientAr::V1::Types::InventoryRecord.from_json(json_object: item)
            end
            next_page_token = struct["next_page_token"]
            new(
              records: records,
              next_page_token: next_page_token,
              additional_properties: struct
            )
          end

          # Serialize an instance of ListInventoryPagedResponse to a JSON object
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
            obj.records.is_a?(Array) != false || raise("Passed value for field obj.records is not the expected type, validation failed.")
            obj.next_page_token&.is_a?(String) != false || raise("Passed value for field obj.next_page_token is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
