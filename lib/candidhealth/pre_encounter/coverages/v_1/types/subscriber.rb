# frozen_string_literal: true

require_relative "../../../common/types/human_name"
require "date"
require_relative "../../../common/types/sex"
require_relative "../../../common/types/address"
require "ostruct"
require "json"

module CandidApiClient
  module PreEncounter
    module Coverages
      module V1
        module Types
          class Subscriber
            # @return [CandidApiClient::PreEncounter::Common::Types::HumanName]
            attr_reader :name
            # @return [Date]
            attr_reader :date_of_birth
            # @return [CandidApiClient::PreEncounter::Common::Types::Sex]
            attr_reader :biological_sex
            # @return [CandidApiClient::PreEncounter::Common::Types::Address]
            attr_reader :address
            # @return [OpenStruct] Additional properties unmapped to the current class definition
            attr_reader :additional_properties
            # @return [Object]
            attr_reader :_field_set
            protected :_field_set

            OMIT = Object.new

            # @param name [CandidApiClient::PreEncounter::Common::Types::HumanName]
            # @param date_of_birth [Date]
            # @param biological_sex [CandidApiClient::PreEncounter::Common::Types::Sex]
            # @param address [CandidApiClient::PreEncounter::Common::Types::Address]
            # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
            # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::Subscriber]
            def initialize(name:, biological_sex:, date_of_birth: OMIT, address: OMIT, additional_properties: nil)
              @name = name
              @date_of_birth = date_of_birth if date_of_birth != OMIT
              @biological_sex = biological_sex
              @address = address if address != OMIT
              @additional_properties = additional_properties
              @_field_set = {
                "name": name,
                "date_of_birth": date_of_birth,
                "biological_sex": biological_sex,
                "address": address
              }.reject do |_k, v|
                v == OMIT
              end
            end

            # Deserialize a JSON object to an instance of Subscriber
            #
            # @param json_object [String]
            # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::Subscriber]
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
              biological_sex = struct["biological_sex"]
              if parsed_json["address"].nil?
                address = nil
              else
                address = parsed_json["address"].to_json
                address = CandidApiClient::PreEncounter::Common::Types::Address.from_json(json_object: address)
              end
              new(
                name: name,
                date_of_birth: date_of_birth,
                biological_sex: biological_sex,
                address: address,
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
              obj.date_of_birth&.is_a?(Date) != false || raise("Passed value for field obj.date_of_birth is not the expected type, validation failed.")
              obj.biological_sex.is_a?(CandidApiClient::PreEncounter::Common::Types::Sex) != false || raise("Passed value for field obj.biological_sex is not the expected type, validation failed.")
              obj.address.nil? || CandidApiClient::PreEncounter::Common::Types::Address.validate_raw(obj: obj.address)
            end
          end
        end
      end
    end
  end
end
