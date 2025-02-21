# frozen_string_literal: true

require_relative "visit"
require "ostruct"
require "json"

module CandidApiClient
  module PreEncounter
    module Appointments
      module V1
        module Types
          class VisitsPage
            # @return [Array<CandidApiClient::PreEncounter::Appointments::V1::Types::Visit>]
            attr_reader :items
            # @return [String]
            attr_reader :next_page_token
            # @return [String]
            attr_reader :prev_page_token
            # @return [Integer]
            attr_reader :total
            # @return [OpenStruct] Additional properties unmapped to the current class definition
            attr_reader :additional_properties
            # @return [Object]
            attr_reader :_field_set
            protected :_field_set

            OMIT = Object.new

            # @param items [Array<CandidApiClient::PreEncounter::Appointments::V1::Types::Visit>]
            # @param next_page_token [String]
            # @param prev_page_token [String]
            # @param total [Integer]
            # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
            # @return [CandidApiClient::PreEncounter::Appointments::V1::Types::VisitsPage]
            def initialize(items:, total:, next_page_token: OMIT, prev_page_token: OMIT, additional_properties: nil)
              @items = items
              @next_page_token = next_page_token if next_page_token != OMIT
              @prev_page_token = prev_page_token if prev_page_token != OMIT
              @total = total
              @additional_properties = additional_properties
              @_field_set = {
                "items": items,
                "next_page_token": next_page_token,
                "prev_page_token": prev_page_token,
                "total": total
              }.reject do |_k, v|
                v == OMIT
              end
            end

            # Deserialize a JSON object to an instance of VisitsPage
            #
            # @param json_object [String]
            # @return [CandidApiClient::PreEncounter::Appointments::V1::Types::VisitsPage]
            def self.from_json(json_object:)
              struct = JSON.parse(json_object, object_class: OpenStruct)
              parsed_json = JSON.parse(json_object)
              items = parsed_json["items"]&.map do |item|
                item = item.to_json
                CandidApiClient::PreEncounter::Appointments::V1::Types::Visit.from_json(json_object: item)
              end
              next_page_token = struct["next_page_token"]
              prev_page_token = struct["prev_page_token"]
              total = struct["total"]
              new(
                items: items,
                next_page_token: next_page_token,
                prev_page_token: prev_page_token,
                total: total,
                additional_properties: struct
              )
            end

            # Serialize an instance of VisitsPage to a JSON object
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
              obj.items.is_a?(Array) != false || raise("Passed value for field obj.items is not the expected type, validation failed.")
              obj.next_page_token&.is_a?(String) != false || raise("Passed value for field obj.next_page_token is not the expected type, validation failed.")
              obj.prev_page_token&.is_a?(String) != false || raise("Passed value for field obj.prev_page_token is not the expected type, validation failed.")
              obj.total.is_a?(Integer) != false || raise("Passed value for field obj.total is not the expected type, validation failed.")
            end
          end
        end
      end
    end
  end
end
