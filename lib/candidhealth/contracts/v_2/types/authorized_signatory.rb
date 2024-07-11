# frozen_string_literal: true

require "ostruct"
require "json"

module CandidApiClient
  module Contracts
    module V2
      module Types
        class AuthorizedSignatory
          # @return [String]
          attr_reader :first_name
          # @return [String]
          attr_reader :last_name
          # @return [String]
          attr_reader :title
          # @return [String]
          attr_reader :email
          # @return [String]
          attr_reader :phone
          # @return [String]
          attr_reader :fax
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param first_name [String]
          # @param last_name [String]
          # @param title [String]
          # @param email [String]
          # @param phone [String]
          # @param fax [String]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::Contracts::V2::Types::AuthorizedSignatory]
          def initialize(first_name: OMIT, last_name: OMIT, title: OMIT, email: OMIT, phone: OMIT, fax: OMIT,
                         additional_properties: nil)
            @first_name = first_name if first_name != OMIT
            @last_name = last_name if last_name != OMIT
            @title = title if title != OMIT
            @email = email if email != OMIT
            @phone = phone if phone != OMIT
            @fax = fax if fax != OMIT
            @additional_properties = additional_properties
            @_field_set = {
              "first_name": first_name,
              "last_name": last_name,
              "title": title,
              "email": email,
              "phone": phone,
              "fax": fax
            }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of AuthorizedSignatory
          #
          # @param json_object [String]
          # @return [CandidApiClient::Contracts::V2::Types::AuthorizedSignatory]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            first_name = struct["first_name"]
            last_name = struct["last_name"]
            title = struct["title"]
            email = struct["email"]
            phone = struct["phone"]
            fax = struct["fax"]
            new(
              first_name: first_name,
              last_name: last_name,
              title: title,
              email: email,
              phone: phone,
              fax: fax,
              additional_properties: struct
            )
          end

          # Serialize an instance of AuthorizedSignatory to a JSON object
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
end
