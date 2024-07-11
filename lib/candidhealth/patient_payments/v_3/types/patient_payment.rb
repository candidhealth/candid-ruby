# frozen_string_literal: true

require_relative "patient_payment_source"
require "date"
require_relative "patient_payment_status"
require "ostruct"
require "json"

module CandidApiClient
  module PatientPayments
    module V3
      module Types
        class PatientPayment
          # @return [String]
          attr_reader :patient_payment_id
          # @return [String]
          attr_reader :organization_id
          # @return [String]
          attr_reader :source_internal_id
          # @return [CandidApiClient::PatientPayments::V3::Types::PatientPaymentSource]
          attr_reader :source
          # @return [Integer]
          attr_reader :amount_cents
          # @return [DateTime]
          attr_reader :payment_timestamp
          # @return [CandidApiClient::PatientPayments::V3::Types::PatientPaymentStatus]
          attr_reader :status
          # @return [String]
          attr_reader :payment_name
          # @return [String]
          attr_reader :payment_note
          # @return [String]
          attr_reader :patient_external_id
          # @return [String]
          attr_reader :encounter_external_id
          # @return [String]
          attr_reader :service_line_id
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param patient_payment_id [String]
          # @param organization_id [String]
          # @param source_internal_id [String]
          # @param source [CandidApiClient::PatientPayments::V3::Types::PatientPaymentSource]
          # @param amount_cents [Integer]
          # @param payment_timestamp [DateTime]
          # @param status [CandidApiClient::PatientPayments::V3::Types::PatientPaymentStatus]
          # @param payment_name [String]
          # @param payment_note [String]
          # @param patient_external_id [String]
          # @param encounter_external_id [String]
          # @param service_line_id [String]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::PatientPayments::V3::Types::PatientPayment]
          def initialize(patient_payment_id:, organization_id:, source_internal_id:, source:, amount_cents:,
                         payment_timestamp: OMIT, status: OMIT, payment_name: OMIT, payment_note: OMIT, patient_external_id: OMIT, encounter_external_id: OMIT, service_line_id: OMIT, additional_properties: nil)
            @patient_payment_id = patient_payment_id
            @organization_id = organization_id
            @source_internal_id = source_internal_id
            @source = source
            @amount_cents = amount_cents
            @payment_timestamp = payment_timestamp if payment_timestamp != OMIT
            @status = status if status != OMIT
            @payment_name = payment_name if payment_name != OMIT
            @payment_note = payment_note if payment_note != OMIT
            @patient_external_id = patient_external_id if patient_external_id != OMIT
            @encounter_external_id = encounter_external_id if encounter_external_id != OMIT
            @service_line_id = service_line_id if service_line_id != OMIT
            @additional_properties = additional_properties
            @_field_set = {
              "patient_payment_id": patient_payment_id,
              "organization_id": organization_id,
              "source_internal_id": source_internal_id,
              "source": source,
              "amount_cents": amount_cents,
              "payment_timestamp": payment_timestamp,
              "status": status,
              "payment_name": payment_name,
              "payment_note": payment_note,
              "patient_external_id": patient_external_id,
              "encounter_external_id": encounter_external_id,
              "service_line_id": service_line_id
            }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of PatientPayment
          #
          # @param json_object [String]
          # @return [CandidApiClient::PatientPayments::V3::Types::PatientPayment]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            patient_payment_id = struct["patient_payment_id"]
            organization_id = struct["organization_id"]
            source_internal_id = struct["source_internal_id"]
            source = struct["source"]
            amount_cents = struct["amount_cents"]
            payment_timestamp = unless parsed_json["payment_timestamp"].nil?
                                  DateTime.parse(parsed_json["payment_timestamp"])
                                end
            status = struct["status"]
            payment_name = struct["payment_name"]
            payment_note = struct["payment_note"]
            patient_external_id = struct["patient_external_id"]
            encounter_external_id = struct["encounter_external_id"]
            service_line_id = struct["service_line_id"]
            new(
              patient_payment_id: patient_payment_id,
              organization_id: organization_id,
              source_internal_id: source_internal_id,
              source: source,
              amount_cents: amount_cents,
              payment_timestamp: payment_timestamp,
              status: status,
              payment_name: payment_name,
              payment_note: payment_note,
              patient_external_id: patient_external_id,
              encounter_external_id: encounter_external_id,
              service_line_id: service_line_id,
              additional_properties: struct
            )
          end

          # Serialize an instance of PatientPayment to a JSON object
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
            obj.patient_payment_id.is_a?(String) != false || raise("Passed value for field obj.patient_payment_id is not the expected type, validation failed.")
            obj.organization_id.is_a?(String) != false || raise("Passed value for field obj.organization_id is not the expected type, validation failed.")
            obj.source_internal_id.is_a?(String) != false || raise("Passed value for field obj.source_internal_id is not the expected type, validation failed.")
            obj.source.is_a?(CandidApiClient::PatientPayments::V3::Types::PatientPaymentSource) != false || raise("Passed value for field obj.source is not the expected type, validation failed.")
            obj.amount_cents.is_a?(Integer) != false || raise("Passed value for field obj.amount_cents is not the expected type, validation failed.")
            obj.payment_timestamp&.is_a?(DateTime) != false || raise("Passed value for field obj.payment_timestamp is not the expected type, validation failed.")
            obj.status&.is_a?(CandidApiClient::PatientPayments::V3::Types::PatientPaymentStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
            obj.payment_name&.is_a?(String) != false || raise("Passed value for field obj.payment_name is not the expected type, validation failed.")
            obj.payment_note&.is_a?(String) != false || raise("Passed value for field obj.payment_note is not the expected type, validation failed.")
            obj.patient_external_id&.is_a?(String) != false || raise("Passed value for field obj.patient_external_id is not the expected type, validation failed.")
            obj.encounter_external_id&.is_a?(String) != false || raise("Passed value for field obj.encounter_external_id is not the expected type, validation failed.")
            obj.service_line_id&.is_a?(String) != false || raise("Passed value for field obj.service_line_id is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
