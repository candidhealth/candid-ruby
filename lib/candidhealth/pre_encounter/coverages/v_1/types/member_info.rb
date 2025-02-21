# frozen_string_literal: true

require "date"
require "ostruct"
require "json"

module CandidApiClient
  module PreEncounter
    module Coverages
      module V1
        module Types
          class MemberInfo
            # @return [String]
            attr_reader :member_id
            # @return [String]
            attr_reader :first_name
            # @return [String]
            attr_reader :last_name
            # @return [Date]
            attr_reader :date_of_birth
            # @return [OpenStruct] Additional properties unmapped to the current class definition
            attr_reader :additional_properties
            # @return [Object]
            attr_reader :_field_set
            protected :_field_set

            OMIT = Object.new

            # @param member_id [String]
            # @param first_name [String]
            # @param last_name [String]
            # @param date_of_birth [Date]
            # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
            # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::MemberInfo]
            def initialize(member_id:, first_name:, last_name:, date_of_birth:, additional_properties: nil)
              @member_id = member_id
              @first_name = first_name
              @last_name = last_name
              @date_of_birth = date_of_birth
              @additional_properties = additional_properties
              @_field_set = {
                "member_id": member_id,
                "first_name": first_name,
                "last_name": last_name,
                "date_of_birth": date_of_birth
              }
            end

            # Deserialize a JSON object to an instance of MemberInfo
            #
            # @param json_object [String]
            # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::MemberInfo]
            def self.from_json(json_object:)
              struct = JSON.parse(json_object, object_class: OpenStruct)
              parsed_json = JSON.parse(json_object)
              member_id = struct["member_id"]
              first_name = struct["first_name"]
              last_name = struct["last_name"]
              date_of_birth = (Date.parse(parsed_json["date_of_birth"]) unless parsed_json["date_of_birth"].nil?)
              new(
                member_id: member_id,
                first_name: first_name,
                last_name: last_name,
                date_of_birth: date_of_birth,
                additional_properties: struct
              )
            end

            # Serialize an instance of MemberInfo to a JSON object
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
              obj.member_id.is_a?(String) != false || raise("Passed value for field obj.member_id is not the expected type, validation failed.")
              obj.first_name.is_a?(String) != false || raise("Passed value for field obj.first_name is not the expected type, validation failed.")
              obj.last_name.is_a?(String) != false || raise("Passed value for field obj.last_name is not the expected type, validation failed.")
              obj.date_of_birth.is_a?(Date) != false || raise("Passed value for field obj.date_of_birth is not the expected type, validation failed.")
            end
          end
        end
      end
    end
  end
end
