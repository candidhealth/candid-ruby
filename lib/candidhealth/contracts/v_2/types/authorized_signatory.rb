# frozen_string_literal: true

require "json"

module CandidApiClient
  module Contracts
    module V2
      class AuthorizedSignatory
        attr_reader :first_name, :last_name, :title, :email, :phone, :fax, :additional_properties

        # @param first_name [String]
        # @param last_name [String]
        # @param title [String]
        # @param email [String]
        # @param phone [String]
        # @param fax [String]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [Contracts::V2::AuthorizedSignatory]
        def initialize(first_name: nil, last_name: nil, title: nil, email: nil, phone: nil, fax: nil,
                       additional_properties: nil)
          # @type [String]
          @first_name = first_name
          # @type [String]
          @last_name = last_name
          # @type [String]
          @title = title
          # @type [String]
          @email = email
          # @type [String]
          @phone = phone
          # @type [String]
          @fax = fax
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of AuthorizedSignatory
        #
        # @param json_object [JSON]
        # @return [Contracts::V2::AuthorizedSignatory]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          JSON.parse(json_object)
          first_name = struct.first_name
          last_name = struct.last_name
          title = struct.title
          email = struct.email
          phone = struct.phone
          fax = struct.fax
          new(first_name: first_name, last_name: last_name, title: title, email: email, phone: phone, fax: fax,
              additional_properties: struct)
        end

        # Serialize an instance of AuthorizedSignatory to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          {
            "first_name": @first_name,
            "last_name": @last_name,
            "title": @title,
            "email": @email,
            "phone": @phone,
            "fax": @fax
          }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          obj.first_name&.is_a?(String) != false || raise("Passed value for field obj.first_name is not the expected type, validation failed.")
          obj.last_name&.is_a?(String) != false || raise("Passed value for field obj.last_name is not the expected type, validation failed.")
          obj.title&.is_a?(String) != false || raise("Passed value for field obj.title is not the expected type, validation failed.")
          obj.email&.is_a?(String) != false || raise("Passed value for field obj.email is not the expected type, validation failed.")
          obj.phone&.is_a?(String) != false || raise("Passed value for field obj.phone is not the expected type, validation failed.")
          obj.fax&.is_a?(String) != false || raise("Passed value for field obj.fax is not the expected type, validation failed.")
        end
      end
    end
  end
end
