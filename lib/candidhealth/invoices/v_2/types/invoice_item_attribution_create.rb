# frozen_string_literal: true

require "json"

module CandidApiClient
  module Invoices
    module V2
      module Types
        # Points to the claim or service line that this invoice is attributed to
        class InvoiceItemAttributionCreate
          # @return [Object]
          attr_reader :member
          # @return [String]
          attr_reader :discriminant

          private_class_method :new
          alias kind_of? is_a?

          # @param member [Object]
          # @param discriminant [String]
          # @return [CandidApiClient::Invoices::V2::Types::InvoiceItemAttributionCreate]
          def initialize(member:, discriminant:)
            @member = member
            @discriminant = discriminant
          end

          # Deserialize a JSON object to an instance of InvoiceItemAttributionCreate
          #
          # @param json_object [String]
          # @return [CandidApiClient::Invoices::V2::Types::InvoiceItemAttributionCreate]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            member = case struct.type
                     when "service_line_id"
                       json_object.value
                     when "claim_id"
                       json_object.value
                     when "unattributed"
                       nil
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
            when "service_line_id"
              { "type": @discriminant, "value": @member }.to_json
            when "claim_id"
              { "type": @discriminant, "value": @member }.to_json
            when "unattributed"
              { type: @discriminant }.to_json
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
            when "service_line_id"
              obj.is_a?(String) != false || raise("Passed value for field obj is not the expected type, validation failed.")
            when "claim_id"
              obj.is_a?(String) != false || raise("Passed value for field obj is not the expected type, validation failed.")
            when "unattributed"
              # noop
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

          # @param member [String]
          # @return [CandidApiClient::Invoices::V2::Types::InvoiceItemAttributionCreate]
          def self.service_line_id(member:)
            new(member: member, discriminant: "service_line_id")
          end

          # @param member [String]
          # @return [CandidApiClient::Invoices::V2::Types::InvoiceItemAttributionCreate]
          def self.claim_id(member:)
            new(member: member, discriminant: "claim_id")
          end

          # @return [CandidApiClient::Invoices::V2::Types::InvoiceItemAttributionCreate]
          def self.unattributed
            new(member: nil, discriminant: "unattributed")
          end
        end
      end
    end
  end
end
