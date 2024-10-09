# frozen_string_literal: true

require_relative "non_insurance_payer_description_update"
require_relative "non_insurance_payer_category_update"
require_relative "non_insurance_payer_address_update"
require "ostruct"
require "json"

module CandidApiClient
  module NonInsurancePayers
    module V1
      module Types
        class NonInsurancePayerUpdateRequest
          # @return [String] Max 50 characters allowed
          attr_reader :name
          # @return [CandidApiClient::NonInsurancePayers::V1::Types::NonInsurancePayerDescriptionUpdate]
          attr_reader :description
          # @return [CandidApiClient::NonInsurancePayers::V1::Types::NonInsurancePayerCategoryUpdate]
          attr_reader :category
          # @return [CandidApiClient::NonInsurancePayers::V1::Types::NonInsurancePayerAddressUpdate]
          attr_reader :address
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param name [String] Max 50 characters allowed
          # @param description [CandidApiClient::NonInsurancePayers::V1::Types::NonInsurancePayerDescriptionUpdate]
          # @param category [CandidApiClient::NonInsurancePayers::V1::Types::NonInsurancePayerCategoryUpdate]
          # @param address [CandidApiClient::NonInsurancePayers::V1::Types::NonInsurancePayerAddressUpdate]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::NonInsurancePayers::V1::Types::NonInsurancePayerUpdateRequest]
          def initialize(name: OMIT, description: OMIT, category: OMIT, address: OMIT, additional_properties: nil)
            @name = name if name != OMIT
            @description = description if description != OMIT
            @category = category if category != OMIT
            @address = address if address != OMIT
            @additional_properties = additional_properties
            @_field_set = {
              "name": name,
              "description": description,
              "category": category,
              "address": address
            }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of NonInsurancePayerUpdateRequest
          #
          # @param json_object [String]
          # @return [CandidApiClient::NonInsurancePayers::V1::Types::NonInsurancePayerUpdateRequest]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            name = struct["name"]
            if parsed_json["description"].nil?
              description = nil
            else
              description = parsed_json["description"].to_json
              description = CandidApiClient::NonInsurancePayers::V1::Types::NonInsurancePayerDescriptionUpdate.from_json(json_object: description)
            end
            if parsed_json["category"].nil?
              category = nil
            else
              category = parsed_json["category"].to_json
              category = CandidApiClient::NonInsurancePayers::V1::Types::NonInsurancePayerCategoryUpdate.from_json(json_object: category)
            end
            if parsed_json["address"].nil?
              address = nil
            else
              address = parsed_json["address"].to_json
              address = CandidApiClient::NonInsurancePayers::V1::Types::NonInsurancePayerAddressUpdate.from_json(json_object: address)
            end
            new(
              name: name,
              description: description,
              category: category,
              address: address,
              additional_properties: struct
            )
          end

          # Serialize an instance of NonInsurancePayerUpdateRequest to a JSON object
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
            obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
            obj.description.nil? || CandidApiClient::NonInsurancePayers::V1::Types::NonInsurancePayerDescriptionUpdate.validate_raw(obj: obj.description)
            obj.category.nil? || CandidApiClient::NonInsurancePayers::V1::Types::NonInsurancePayerCategoryUpdate.validate_raw(obj: obj.category)
            obj.address.nil? || CandidApiClient::NonInsurancePayers::V1::Types::NonInsurancePayerAddressUpdate.validate_raw(obj: obj.address)
          end
        end
      end
    end
  end
end
