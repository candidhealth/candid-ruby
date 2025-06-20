# frozen_string_literal: true

require_relative "../../commons/types/patient_relationship_to_insured_code_all"
require "date"
require_relative "../../commons/types/street_address_short_zip_optional"
require_relative "gender"
require "ostruct"
require "json"

module CandidApiClient
  module Individual
    module Types
      class SubscriberBaseOptional
        # @return [CandidApiClient::Commons::Types::PatientRelationshipToInsuredCodeAll]
        attr_reader :patient_relationship_to_subscriber_code
        # @return [Date]
        attr_reader :date_of_birth
        # @return [CandidApiClient::Commons::Types::StreetAddressShortZipOptional]
        attr_reader :address
        # @return [String]
        attr_reader :first_name
        # @return [String]
        attr_reader :last_name
        # @return [CandidApiClient::Individual::Types::Gender]
        attr_reader :gender
        # @return [OpenStruct] Additional properties unmapped to the current class definition
        attr_reader :additional_properties
        # @return [Object]
        attr_reader :_field_set
        protected :_field_set

        OMIT = Object.new

        # @param patient_relationship_to_subscriber_code [CandidApiClient::Commons::Types::PatientRelationshipToInsuredCodeAll]
        # @param date_of_birth [Date]
        # @param address [CandidApiClient::Commons::Types::StreetAddressShortZipOptional]
        # @param first_name [String]
        # @param last_name [String]
        # @param gender [CandidApiClient::Individual::Types::Gender]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [CandidApiClient::Individual::Types::SubscriberBaseOptional]
        def initialize(patient_relationship_to_subscriber_code: OMIT, date_of_birth: OMIT, address: OMIT,
                       first_name: OMIT, last_name: OMIT, gender: OMIT, additional_properties: nil)
          if patient_relationship_to_subscriber_code != OMIT
            @patient_relationship_to_subscriber_code = patient_relationship_to_subscriber_code
          end
          @date_of_birth = date_of_birth if date_of_birth != OMIT
          @address = address if address != OMIT
          @first_name = first_name if first_name != OMIT
          @last_name = last_name if last_name != OMIT
          @gender = gender if gender != OMIT
          @additional_properties = additional_properties
          @_field_set = {
            "patient_relationship_to_subscriber_code": patient_relationship_to_subscriber_code,
            "date_of_birth": date_of_birth,
            "address": address,
            "first_name": first_name,
            "last_name": last_name,
            "gender": gender
          }.reject do |_k, v|
            v == OMIT
          end
        end

        # Deserialize a JSON object to an instance of SubscriberBaseOptional
        #
        # @param json_object [String]
        # @return [CandidApiClient::Individual::Types::SubscriberBaseOptional]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          parsed_json = JSON.parse(json_object)
          patient_relationship_to_subscriber_code = struct["patient_relationship_to_subscriber_code"]
          date_of_birth = (Date.parse(parsed_json["date_of_birth"]) unless parsed_json["date_of_birth"].nil?)
          if parsed_json["address"].nil?
            address = nil
          else
            address = parsed_json["address"].to_json
            address = CandidApiClient::Commons::Types::StreetAddressShortZipOptional.from_json(json_object: address)
          end
          first_name = struct["first_name"]
          last_name = struct["last_name"]
          gender = struct["gender"]
          new(
            patient_relationship_to_subscriber_code: patient_relationship_to_subscriber_code,
            date_of_birth: date_of_birth,
            address: address,
            first_name: first_name,
            last_name: last_name,
            gender: gender,
            additional_properties: struct
          )
        end

        # Serialize an instance of SubscriberBaseOptional to a JSON object
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
          obj.patient_relationship_to_subscriber_code&.is_a?(CandidApiClient::Commons::Types::PatientRelationshipToInsuredCodeAll) != false || raise("Passed value for field obj.patient_relationship_to_subscriber_code is not the expected type, validation failed.")
          obj.date_of_birth&.is_a?(Date) != false || raise("Passed value for field obj.date_of_birth is not the expected type, validation failed.")
          obj.address.nil? || CandidApiClient::Commons::Types::StreetAddressShortZipOptional.validate_raw(obj: obj.address)
          obj.first_name&.is_a?(String) != false || raise("Passed value for field obj.first_name is not the expected type, validation failed.")
          obj.last_name&.is_a?(String) != false || raise("Passed value for field obj.last_name is not the expected type, validation failed.")
          obj.gender&.is_a?(CandidApiClient::Individual::Types::Gender) != false || raise("Passed value for field obj.gender is not the expected type, validation failed.")
        end
      end
    end
  end
end
