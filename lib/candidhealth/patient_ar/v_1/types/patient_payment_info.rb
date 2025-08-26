# frozen_string_literal: true

require_relative "patient_payment_allocation"
require "ostruct"
require "json"

module CandidApiClient
  module PatientAr
    module V1
      module Types
        class PatientPaymentInfo
          # @return [Integer] The total amount of patient payments in cents for the service line.
          attr_reader :total_payment_cents
          # @return [Array<CandidApiClient::PatientAr::V1::Types::PatientPaymentAllocation>] A list of patient payment items associated with the service line.
          attr_reader :items
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param total_payment_cents [Integer] The total amount of patient payments in cents for the service line.
          # @param items [Array<CandidApiClient::PatientAr::V1::Types::PatientPaymentAllocation>] A list of patient payment items associated with the service line.
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::PatientAr::V1::Types::PatientPaymentInfo]
          def initialize(total_payment_cents:, items:, additional_properties: nil)
            @total_payment_cents = total_payment_cents
            @items = items
            @additional_properties = additional_properties
            @_field_set = { "total_payment_cents": total_payment_cents, "items": items }
          end

          # Deserialize a JSON object to an instance of PatientPaymentInfo
          #
          # @param json_object [String]
          # @return [CandidApiClient::PatientAr::V1::Types::PatientPaymentInfo]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            total_payment_cents = struct["total_payment_cents"]
            items = parsed_json["items"]&.map do |item|
              item = item.to_json
              CandidApiClient::PatientAr::V1::Types::PatientPaymentAllocation.from_json(json_object: item)
            end
            new(
              total_payment_cents: total_payment_cents,
              items: items,
              additional_properties: struct
            )
          end

          # Serialize an instance of PatientPaymentInfo to a JSON object
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
            obj.total_payment_cents.is_a?(Integer) != false || raise("Passed value for field obj.total_payment_cents is not the expected type, validation failed.")
            obj.items.is_a?(Array) != false || raise("Passed value for field obj.items is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
