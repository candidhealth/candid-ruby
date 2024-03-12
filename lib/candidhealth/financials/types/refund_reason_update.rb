# frozen_string_literal: true

require "json"
require_relative "refund_reason"

module CandidApiClient
  class Financials
    class RefundReasonUpdate
      attr_reader :member, :discriminant

      private_class_method :new
      alias kind_of? is_a?
      # @param member [Object]
      # @param discriminant [String]
      # @return [Financials::RefundReasonUpdate]
      def initialize(member:, discriminant:)
        # @type [Object]
        @member = member
        # @type [String]
        @discriminant = discriminant
      end

      # Deserialize a JSON object to an instance of RefundReasonUpdate
      #
      # @param json_object [JSON]
      # @return [Financials::RefundReasonUpdate]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        member = case struct.type
                 when "set"
                   json_object.value
                 when "remove"
                   nil
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
        when "set"
          { "type": @discriminant, "value": @member }.to_json
        when "remove"
          { type: @discriminant }.to_json
        else
          { "type": @discriminant, value: @member }.to_json
        end
        @member.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        case obj.type
        when "set"
          obj.is_a?(Financials::RefundReason) != false || raise("Passed value for field obj is not the expected type, validation failed.")
        when "remove"
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

      # @param member [Financials::RefundReason]
      # @return [Financials::RefundReasonUpdate]
      def self.set(member:)
        new(member: member, discriminant: "set")
      end

      # @return [Financials::RefundReasonUpdate]
      def self.remove
        new(member: nil, discriminant: "remove")
      end
    end
  end
end
