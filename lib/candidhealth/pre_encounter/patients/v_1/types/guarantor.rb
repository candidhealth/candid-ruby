# frozen_string_literal: true

require_relative "../../../common/types/human_name"
require_relative "../../../common/types/contact_point"
require "date"
require_relative "../../../common/types/address"
require "ostruct"
require "json"

module CandidApiClient
  module PreEncounter
    module Patients
      module V1
        module Types
          class Guarantor
            # @return [CandidApiClient::PreEncounter::Common::Types::HumanName]
            attr_reader :name
            # @return [CandidApiClient::PreEncounter::Common::Types::ContactPoint]
            attr_reader :telecom
            # @return [String]
            attr_reader :email
            # @return [Date]
            attr_reader :birth_date
            # @return [CandidApiClient::PreEncounter::Common::Types::Address]
            attr_reader :address
            # @return [OpenStruct] Additional properties unmapped to the current class definition
            attr_reader :additional_properties
            # @return [Object]
            attr_reader :_field_set
            protected :_field_set

            OMIT = Object.new

            # @param name [CandidApiClient::PreEncounter::Common::Types::HumanName]
            # @param telecom [CandidApiClient::PreEncounter::Common::Types::ContactPoint]
            # @param email [String]
            # @param birth_date [Date]
            # @param address [CandidApiClient::PreEncounter::Common::Types::Address]
            # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
            # @return [CandidApiClient::PreEncounter::Patients::V1::Types::Guarantor]
            def initialize(name:, telecom:, birth_date:, address:, email: OMIT, additional_properties: nil)
              @name = name
              @telecom = telecom
              @email = email if email != OMIT
              @birth_date = birth_date
              @address = address
              @additional_properties = additional_properties
              @_field_set = {
                "name": name,
                "telecom": telecom,
                "email": email,
                "birth_date": birth_date,
                "address": address
              }.reject do |_k, v|
                v == OMIT
              end
            end

            # Deserialize a JSON object to an instance of Guarantor
            #
            # @param json_object [String]
            # @return [CandidApiClient::PreEncounter::Patients::V1::Types::Guarantor]
            def self.from_json(json_object:)
              struct = JSON.parse(json_object, object_class: OpenStruct)
              parsed_json = JSON.parse(json_object)
              if parsed_json["name"].nil?
                name = nil
              else
                name = parsed_json["name"].to_json
                name = CandidApiClient::PreEncounter::Common::Types::HumanName.from_json(json_object: name)
              end
              if parsed_json["telecom"].nil?
                telecom = nil
              else
                telecom = parsed_json["telecom"].to_json
                telecom = CandidApiClient::PreEncounter::Common::Types::ContactPoint.from_json(json_object: telecom)
              end
              email = struct["email"]
              birth_date = (Date.parse(parsed_json["birth_date"]) unless parsed_json["birth_date"].nil?)
              if parsed_json["address"].nil?
                address = nil
              else
                address = parsed_json["address"].to_json
                address = CandidApiClient::PreEncounter::Common::Types::Address.from_json(json_object: address)
              end
              new(
                name: name,
                telecom: telecom,
                email: email,
                birth_date: birth_date,
                address: address,
                additional_properties: struct
              )
            end

            # Serialize an instance of Guarantor to a JSON object
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
              CandidApiClient::PreEncounter::Common::Types::ContactPoint.validate_raw(obj: obj.telecom)
              obj.email&.is_a?(String) != false || raise("Passed value for field obj.email is not the expected type, validation failed.")
              obj.birth_date.is_a?(Date) != false || raise("Passed value for field obj.birth_date is not the expected type, validation failed.")
              CandidApiClient::PreEncounter::Common::Types::Address.validate_raw(obj: obj.address)
            end
          end
        end
      end
    end
  end
end
