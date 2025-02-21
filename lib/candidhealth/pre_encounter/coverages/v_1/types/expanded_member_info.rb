# frozen_string_literal: true

require_relative "address"
require "ostruct"
require "json"

module CandidApiClient
  module PreEncounter
    module Coverages
      module V1
        module Types
          class ExpandedMemberInfo
            # @return [String]
            attr_reader :member_id
            # @return [String]
            attr_reader :group_number
            # @return [String]
            attr_reader :first_name
            # @return [String]
            attr_reader :middle_name
            # @return [String]
            attr_reader :last_name
            # @return [String]
            attr_reader :date_of_birth
            # @return [String]
            attr_reader :gender
            # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::Address]
            attr_reader :address
            # @return [OpenStruct] Additional properties unmapped to the current class definition
            attr_reader :additional_properties
            # @return [Object]
            attr_reader :_field_set
            protected :_field_set

            OMIT = Object.new

            # @param member_id [String]
            # @param group_number [String]
            # @param first_name [String]
            # @param middle_name [String]
            # @param last_name [String]
            # @param date_of_birth [String]
            # @param gender [String]
            # @param address [CandidApiClient::PreEncounter::Coverages::V1::Types::Address]
            # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
            # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::ExpandedMemberInfo]
            def initialize(member_id: OMIT, group_number: OMIT, first_name: OMIT, middle_name: OMIT, last_name: OMIT,
                           date_of_birth: OMIT, gender: OMIT, address: OMIT, additional_properties: nil)
              @member_id = member_id if member_id != OMIT
              @group_number = group_number if group_number != OMIT
              @first_name = first_name if first_name != OMIT
              @middle_name = middle_name if middle_name != OMIT
              @last_name = last_name if last_name != OMIT
              @date_of_birth = date_of_birth if date_of_birth != OMIT
              @gender = gender if gender != OMIT
              @address = address if address != OMIT
              @additional_properties = additional_properties
              @_field_set = {
                "member_id": member_id,
                "group_number": group_number,
                "first_name": first_name,
                "middle_name": middle_name,
                "last_name": last_name,
                "date_of_birth": date_of_birth,
                "gender": gender,
                "address": address
              }.reject do |_k, v|
                v == OMIT
              end
            end

            # Deserialize a JSON object to an instance of ExpandedMemberInfo
            #
            # @param json_object [String]
            # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::ExpandedMemberInfo]
            def self.from_json(json_object:)
              struct = JSON.parse(json_object, object_class: OpenStruct)
              parsed_json = JSON.parse(json_object)
              member_id = struct["member_id"]
              group_number = struct["group_number"]
              first_name = struct["first_name"]
              middle_name = struct["middle_name"]
              last_name = struct["last_name"]
              date_of_birth = struct["date_of_birth"]
              gender = struct["gender"]
              if parsed_json["address"].nil?
                address = nil
              else
                address = parsed_json["address"].to_json
                address = CandidApiClient::PreEncounter::Coverages::V1::Types::Address.from_json(json_object: address)
              end
              new(
                member_id: member_id,
                group_number: group_number,
                first_name: first_name,
                middle_name: middle_name,
                last_name: last_name,
                date_of_birth: date_of_birth,
                gender: gender,
                address: address,
                additional_properties: struct
              )
            end

            # Serialize an instance of ExpandedMemberInfo to a JSON object
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
              obj.member_id&.is_a?(String) != false || raise("Passed value for field obj.member_id is not the expected type, validation failed.")
              obj.group_number&.is_a?(String) != false || raise("Passed value for field obj.group_number is not the expected type, validation failed.")
              obj.first_name&.is_a?(String) != false || raise("Passed value for field obj.first_name is not the expected type, validation failed.")
              obj.middle_name&.is_a?(String) != false || raise("Passed value for field obj.middle_name is not the expected type, validation failed.")
              obj.last_name&.is_a?(String) != false || raise("Passed value for field obj.last_name is not the expected type, validation failed.")
              obj.date_of_birth&.is_a?(String) != false || raise("Passed value for field obj.date_of_birth is not the expected type, validation failed.")
              obj.gender&.is_a?(String) != false || raise("Passed value for field obj.gender is not the expected type, validation failed.")
              obj.address.nil? || CandidApiClient::PreEncounter::Coverages::V1::Types::Address.validate_raw(obj: obj.address)
            end
          end
        end
      end
    end
  end
end
