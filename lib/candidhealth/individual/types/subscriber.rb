# frozen_string_literal: true

require_relative "individual_id"
require_relative "../../insurance_cards/v_2/types/insurance_card"
require_relative "../../commons/types/patient_relationship_to_insured_code_all"
require_relative "../../commons/types/date"
require_relative "../../commons/types/street_address_short_zip"
require_relative "gender"
require "json"

module CandidApiClient
  class Individual
    class Subscriber
      attr_reader :individual_id, :insurance_card, :patient_relationship_to_subscriber_code, :date_of_birth, :address,
                  :first_name, :last_name, :gender, :additional_properties

      # @param individual_id [Individual::INDIVIDUAL_ID]
      # @param insurance_card [InsuranceCards::V2::InsuranceCard]
      # @param patient_relationship_to_subscriber_code [Commons::PatientRelationshipToInsuredCodeAll]
      # @param date_of_birth [Commons::DATE]
      # @param address [Commons::StreetAddressShortZip]
      # @param first_name [String]
      # @param last_name [String]
      # @param gender [Individual::Gender]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Individual::Subscriber]
      def initialize(individual_id:, insurance_card:, patient_relationship_to_subscriber_code:, first_name:, last_name:, gender:, date_of_birth: nil,
                     address: nil, additional_properties: nil)
        # @type [Individual::INDIVIDUAL_ID]
        @individual_id = individual_id
        # @type [InsuranceCards::V2::InsuranceCard]
        @insurance_card = insurance_card
        # @type [Commons::PatientRelationshipToInsuredCodeAll]
        @patient_relationship_to_subscriber_code = patient_relationship_to_subscriber_code
        # @type [Commons::DATE]
        @date_of_birth = date_of_birth
        # @type [Commons::StreetAddressShortZip]
        @address = address
        # @type [String]
        @first_name = first_name
        # @type [String]
        @last_name = last_name
        # @type [Individual::Gender]
        @gender = gender
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of Subscriber
      #
      # @param json_object [JSON]
      # @return [Individual::Subscriber]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        individual_id = struct.individual_id
        if parsed_json["insurance_card"].nil?
          insurance_card = nil
        else
          insurance_card = parsed_json["insurance_card"].to_json
          insurance_card = InsuranceCards::V2::InsuranceCard.from_json(json_object: insurance_card)
        end
        patient_relationship_to_subscriber_code = struct.patient_relationship_to_subscriber_code
        date_of_birth = struct.date_of_birth
        if parsed_json["address"].nil?
          address = nil
        else
          address = parsed_json["address"].to_json
          address = Commons::StreetAddressShortZip.from_json(json_object: address)
        end
        first_name = struct.first_name
        last_name = struct.last_name
        gender = struct.gender
        new(individual_id: individual_id, insurance_card: insurance_card,
            patient_relationship_to_subscriber_code: patient_relationship_to_subscriber_code, date_of_birth: date_of_birth, address: address, first_name: first_name, last_name: last_name, gender: gender, additional_properties: struct)
      end

      # Serialize an instance of Subscriber to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "individual_id": @individual_id,
          "insurance_card": @insurance_card,
          "patient_relationship_to_subscriber_code": @patient_relationship_to_subscriber_code,
          "date_of_birth": @date_of_birth,
          "address": @address,
          "first_name": @first_name,
          "last_name": @last_name,
          "gender": @gender
        }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.individual_id.is_a?(String) != false || raise("Passed value for field obj.individual_id is not the expected type, validation failed.")
        InsuranceCards::V2::InsuranceCard.validate_raw(obj: obj.insurance_card)
        obj.patient_relationship_to_subscriber_code.is_a?(Commons::PatientRelationshipToInsuredCodeAll) != false || raise("Passed value for field obj.patient_relationship_to_subscriber_code is not the expected type, validation failed.")
        obj.date_of_birth&.is_a?(String) != false || raise("Passed value for field obj.date_of_birth is not the expected type, validation failed.")
        obj.address.nil? || Commons::StreetAddressShortZip.validate_raw(obj: obj.address)
        obj.first_name.is_a?(String) != false || raise("Passed value for field obj.first_name is not the expected type, validation failed.")
        obj.last_name.is_a?(String) != false || raise("Passed value for field obj.last_name is not the expected type, validation failed.")
        obj.gender.is_a?(Individual::Gender) != false || raise("Passed value for field obj.gender is not the expected type, validation failed.")
      end
    end
  end
end
