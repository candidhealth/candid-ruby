# frozen_string_literal: true

require "json"
require_relative "../../../commons/types/service_line_id"
require_relative "../../../commons/types/claim_id"
require_relative "../../../commons/types/provider_id"

module CandidApiClient
  module WriteOffs
    module V1
      class InsuranceWriteOffTarget
        attr_reader :member, :discriminant

        private_class_method :new
        alias kind_of? is_a?
        # @param member [Object]
        # @param discriminant [String]
        # @return [WriteOffs::V1::InsuranceWriteOffTarget]
        def initialize(member:, discriminant:)
          # @type [Object]
          @member = member
          # @type [String]
          @discriminant = discriminant
        end

        # Deserialize a JSON object to an instance of InsuranceWriteOffTarget
        #
        # @param json_object [JSON]
        # @return [WriteOffs::V1::InsuranceWriteOffTarget]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          member = case struct.type
                   when "service_line_id"
                     json_object.value
                   when "claim_id"
                     json_object.value
                   when "billing_provider_id"
                     json_object.value
                   else
                     json_object
                   end
          new(member: member, discriminant: struct.type)
        end

        # For Union Types, to_json functionality is delegated to the wrapped member.
        #
        # @return [JSON]
        def to_json(*_args)
          case @discriminant
          when "service_line_id"
          when "claim_id"
          when "billing_provider_id"
          end
          { "type": @discriminant, "value": @member }.to_json
          @member.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          case obj.type
          when "service_line_id"
            obj.is_a?(String) != false || raise("Passed value for field obj is not the expected type, validation failed.")
          when "claim_id"
            obj.is_a?(String) != false || raise("Passed value for field obj is not the expected type, validation failed.")
          when "billing_provider_id"
            obj.is_a?(String) != false || raise("Passed value for field obj is not the expected type, validation failed.")
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

        # @param member [Commons::SERVICE_LINE_ID]
        # @return [WriteOffs::V1::InsuranceWriteOffTarget]
        def self.service_line_id(member:)
          new(member: member, discriminant: "service_line_id")
        end

        # @param member [Commons::CLAIM_ID]
        # @return [WriteOffs::V1::InsuranceWriteOffTarget]
        def self.claim_id(member:)
          new(member: member, discriminant: "claim_id")
        end

        # @param member [Commons::PROVIDER_ID]
        # @return [WriteOffs::V1::InsuranceWriteOffTarget]
        def self.billing_provider_id(member:)
          new(member: member, discriminant: "billing_provider_id")
        end
      end
    end
  end
end
