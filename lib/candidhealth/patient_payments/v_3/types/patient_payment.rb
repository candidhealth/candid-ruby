# frozen_string_literal: true

require_relative "patient_payment_id"
require_relative "../../../commons/types/organization_id"
require_relative "patient_payment_source"
require "date"
require_relative "patient_payment_status"
require_relative "../../../commons/types/patient_external_id"
require_relative "../../../commons/types/encounter_external_id"
require_relative "../../../commons/types/service_line_id"
require "json"

module CandidApiClient
  module PatientPayments
    module V3
      class PatientPayment
        attr_reader :patient_payment_id, :organization_id, :source_internal_id, :source, :amount_cents,
                    :payment_timestamp, :status, :payment_name, :payment_note, :patient_external_id, :encounter_external_id, :service_line_id, :additional_properties

        # @param patient_payment_id [PatientPayments::V3::PATIENT_PAYMENT_ID]
        # @param organization_id [Commons::ORGANIZATION_ID]
        # @param source_internal_id [String]
        # @param source [PatientPayments::V3::PatientPaymentSource]
        # @param amount_cents [Integer]
        # @param payment_timestamp [DateTime]
        # @param status [PatientPayments::V3::PatientPaymentStatus]
        # @param payment_name [String]
        # @param payment_note [String]
        # @param patient_external_id [Commons::PATIENT_EXTERNAL_ID]
        # @param encounter_external_id [Commons::ENCOUNTER_EXTERNAL_ID]
        # @param service_line_id [Commons::SERVICE_LINE_ID]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [PatientPayments::V3::PatientPayment]
        def initialize(patient_payment_id:, organization_id:, source_internal_id:, source:, amount_cents:,
                       payment_timestamp: nil, status: nil, payment_name: nil, payment_note: nil, patient_external_id: nil, encounter_external_id: nil, service_line_id: nil, additional_properties: nil)
          # @type [PatientPayments::V3::PATIENT_PAYMENT_ID]
          @patient_payment_id = patient_payment_id
          # @type [Commons::ORGANIZATION_ID]
          @organization_id = organization_id
          # @type [String]
          @source_internal_id = source_internal_id
          # @type [PatientPayments::V3::PatientPaymentSource]
          @source = source
          # @type [Integer]
          @amount_cents = amount_cents
          # @type [DateTime]
          @payment_timestamp = payment_timestamp
          # @type [PatientPayments::V3::PatientPaymentStatus]
          @status = status
          # @type [String]
          @payment_name = payment_name
          # @type [String]
          @payment_note = payment_note
          # @type [Commons::PATIENT_EXTERNAL_ID]
          @patient_external_id = patient_external_id
          # @type [Commons::ENCOUNTER_EXTERNAL_ID]
          @encounter_external_id = encounter_external_id
          # @type [Commons::SERVICE_LINE_ID]
          @service_line_id = service_line_id
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of PatientPayment
        #
        # @param json_object [JSON]
        # @return [PatientPayments::V3::PatientPayment]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          parsed_json = JSON.parse(json_object)
          patient_payment_id = struct.patient_payment_id
          organization_id = struct.organization_id
          source_internal_id = struct.source_internal_id
          source = struct.source
          amount_cents = struct.amount_cents
          payment_timestamp = unless parsed_json["payment_timestamp"].nil?
                                DateTime.parse(parsed_json["payment_timestamp"])
                              end
          status = struct.status
          payment_name = struct.payment_name
          payment_note = struct.payment_note
          patient_external_id = struct.patient_external_id
          encounter_external_id = struct.encounter_external_id
          service_line_id = struct.service_line_id
          new(patient_payment_id: patient_payment_id, organization_id: organization_id,
              source_internal_id: source_internal_id, source: source, amount_cents: amount_cents, payment_timestamp: payment_timestamp, status: status, payment_name: payment_name, payment_note: payment_note, patient_external_id: patient_external_id, encounter_external_id: encounter_external_id, service_line_id: service_line_id, additional_properties: struct)
        end

        # Serialize an instance of PatientPayment to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          {
            "patient_payment_id": @patient_payment_id,
            "organization_id": @organization_id,
            "source_internal_id": @source_internal_id,
            "source": @source,
            "amount_cents": @amount_cents,
            "payment_timestamp": @payment_timestamp,
            "status": @status,
            "payment_name": @payment_name,
            "payment_note": @payment_note,
            "patient_external_id": @patient_external_id,
            "encounter_external_id": @encounter_external_id,
            "service_line_id": @service_line_id
          }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          obj.patient_payment_id.is_a?(String) != false || raise("Passed value for field obj.patient_payment_id is not the expected type, validation failed.")
          obj.organization_id.is_a?(UUID) != false || raise("Passed value for field obj.organization_id is not the expected type, validation failed.")
          obj.source_internal_id.is_a?(String) != false || raise("Passed value for field obj.source_internal_id is not the expected type, validation failed.")
          obj.source.is_a?(PatientPayments::V3::PatientPaymentSource) != false || raise("Passed value for field obj.source is not the expected type, validation failed.")
          obj.amount_cents.is_a?(Integer) != false || raise("Passed value for field obj.amount_cents is not the expected type, validation failed.")
          obj.payment_timestamp&.is_a?(DateTime) != false || raise("Passed value for field obj.payment_timestamp is not the expected type, validation failed.")
          obj.status&.is_a?(PatientPayments::V3::PatientPaymentStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
          obj.payment_name&.is_a?(String) != false || raise("Passed value for field obj.payment_name is not the expected type, validation failed.")
          obj.payment_note&.is_a?(String) != false || raise("Passed value for field obj.payment_note is not the expected type, validation failed.")
          obj.patient_external_id&.is_a?(String) != false || raise("Passed value for field obj.patient_external_id is not the expected type, validation failed.")
          obj.encounter_external_id&.is_a?(String) != false || raise("Passed value for field obj.encounter_external_id is not the expected type, validation failed.")
          obj.service_line_id&.is_a?(UUID) != false || raise("Passed value for field obj.service_line_id is not the expected type, validation failed.")
        end
      end
    end
  end
end
