# frozen_string_literal: true

require "json"
require_relative "../../../commons/types/street_address_short_zip"

module CandidApiClient
  module NonInsurancePayers
    module V1
      module Types
        class NonInsurancePayerAddressUpdate
          # @return [Object]
          attr_reader :member
          # @return [String]
          attr_reader :discriminant

          private_class_method :new
          alias kind_of? is_a?

          # @param member [Object]
          # @param discriminant [String]
          # @return [CandidApiClient::NonInsurancePayers::V1::Types::NonInsurancePayerAddressUpdate]
          def initialize(member:, discriminant:)
            @member = member
            @discriminant = discriminant
          end

          # Deserialize a JSON object to an instance of NonInsurancePayerAddressUpdate
          #
          # @param json_object [String]
          # @return [CandidApiClient::NonInsurancePayers::V1::Types::NonInsurancePayerAddressUpdate]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            member = case struct.type
                     when "remove"
                       nil
                     when "set"
                       CandidApiClient::Commons::Types::StreetAddressShortZip.from_json(json_object: json_object.value)
                     else
                       json_object
                     end
            new(member: member, discriminant: struct.type)
          end

          # For Union Types, to_json functionality is delegated to the wrapped member.
          #
          # @return [String]
          def to_json(*_args)
            case @discriminant
            when "remove"
              { type: @discriminant }.to_json
            when "set"
              { "type": @discriminant, "value": @member }.to_json
            else
              { "type": @discriminant, value: @member }.to_json
            end
            @member.to_json
          end

          # Leveraged for Union-type generation, validate_raw attempts to parse the given
          #  hash and check each fields type against the current object's property
          #  definitions.
          #
          # @param obj [Object]
          # @return [Void]
          def self.validate_raw(obj:)
            case obj.type
            when "remove"
              # noop
            when "set"
              CandidApiClient::Commons::Types::StreetAddressShortZip.validate_raw(obj: obj)
            else
              raise("Passed value matched no type within the union, validation failed.")
            end
          end

          # For Union Types, is_a? functionality is delegated to the wrapped member.
          #
          # @param obj [Object]
          # @return [Boolean]
          def is_a?(obj)
            @member.is_a?(obj)
          end

          # @return [CandidApiClient::NonInsurancePayers::V1::Types::NonInsurancePayerAddressUpdate]
          def self.remove
            new(member: nil, discriminant: "remove")
          end

          # @param member [CandidApiClient::Commons::Types::StreetAddressShortZip]
          # @return [CandidApiClient::NonInsurancePayers::V1::Types::NonInsurancePayerAddressUpdate]
          def self.set(member:)
            new(member: member, discriminant: "set")
          end
        end
      end
    end
  end
end
