# frozen_string_literal: true

require_relative "../../../../common/types/human_name"
require "date"
require_relative "../../../../common/types/gender"
require "ostruct"
require "json"

module CandidApiClient
  module PreEncounter
    module Coverages
      module V1
        module Coverages
          module Types
            class Subscriber
              # @return [CandidApiClient::PreEncounter::Common::Types::HumanName]
              attr_reader :name
              # @return [Date]
              attr_reader :date_of_birth
              # @return [CandidApiClient::PreEncounter::Common::Types::Gender]
              attr_reader :gender
              # @return [OpenStruct] Additional properties unmapped to the current class definition
              attr_reader :additional_properties
              # @return [Object]
              attr_reader :_field_set
              protected :_field_set

              OMIT = Object.new

              # @param name [CandidApiClient::PreEncounter::Common::Types::HumanName]
              # @param date_of_birth [Date]
              # @param gender [CandidApiClient::PreEncounter::Common::Types::Gender]
              # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
              # @return [CandidApiClient::PreEncounter::Coverages::V1::Coverages::Types::Subscriber]
              def initialize(name:, date_of_birth:, gender:, additional_properties: nil)
                @name = name
                @date_of_birth = date_of_birth
                @gender = gender
                @additional_properties = additional_properties
                @_field_set = { "name": name, "date_of_birth": date_of_birth, "gender": gender }
              end

              # Deserialize a JSON object to an instance of Subscriber
              #
              # @param json_object [String]
              # @return [CandidApiClient::PreEncounter::Coverages::V1::Coverages::Types::Subscriber]
              def self.from_json(json_object:)
                struct = JSON.parse(json_object, object_class: OpenStruct)
                parsed_json = JSON.parse(json_object)
                if parsed_json["name"].nil?
                  name = nil
                else
                  name = parsed_json["name"].to_json
                  name = CandidApiClient::PreEncounter::Common::Types::HumanName.from_json(json_object: name)
                end
                date_of_birth = (Date.parse(parsed_json["date_of_birth"]) unless parsed_json["date_of_birth"].nil?)
                gender = struct["gender"]
                new(
                  name: name,
                  date_of_birth: date_of_birth,
                  gender: gender,
                  additional_properties: struct
                )
              end

              # Serialize an instance of Subscriber to a JSON object
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
                CandidApiClient::PreEncounter::Common::Types::HumanName.validate_raw(obj: obj.name)
                obj.date_of_birth.is_a?(Date) != false || raise("Passed value for field obj.date_of_birth is not the expected type, validation failed.")
                obj.gender.is_a?(CandidApiClient::PreEncounter::Common::Types::Gender) != false || raise("Passed value for field obj.gender is not the expected type, validation failed.")
              end
            end
          end
        end
      end
    end
  end
end
