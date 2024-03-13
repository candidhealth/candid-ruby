# frozen_string_literal: true

require_relative "service_type"
require_relative "../../../commons/types/facility_type_code"
require_relative "expected_network_status_subscriber_information"
require_relative "../../../commons/types/street_address_short_zip"
require_relative "../../../organization_providers/v_2/types/organization_provider_id"
require_relative "../../../organization_service_facilities/v_2/types/organization_service_facility_id"
require "date"
require "json"

module CandidApiClient
  module ExpectedNetworkStatus
    module V2
      class ComputeAllInNetworkProvidersRequest
        attr_reader :service_type, :place_of_service_code, :subscriber_information, :patient_address,
                    :billing_provider_id, :organization_service_facility_id, :date_of_service, :additional_properties

        # @param service_type [ExpectedNetworkStatus::V2::ServiceType] For some payers, payer routing depends on whether the rendered service qualifies as a behavioral health visit
        #   (e.g. Blue Shield of California routes to Magellan for behavioral health visits).
        #   For post appointment payer routing, Candid uses a CPT code list to determine whether the appointment qualifies as a
        #   behavioral health visit
        #   (see “Inputs: Service Type” in the appendix for list of qualifying CPT codes and behavioral health routing logic).
        #   Since CPT codes are not available pre-appointment, the service type input is used to determine whether the appointment is expected
        #   to qualify as behavioral health.
        # @param place_of_service_code [Commons::FacilityTypeCode] Expected place of service
        # @param subscriber_information [ExpectedNetworkStatus::V2::ExpectedNetworkStatusSubscriberInformation] Information present on the patient's insurance card
        # @param patient_address [Commons::StreetAddressShortZip]
        # @param billing_provider_id [OrganizationProviders::V2::ORGANIZATION_PROVIDER_ID]
        # @param organization_service_facility_id [OrganizationServiceFacilities::V2::ORGANIZATION_SERVICE_FACILITY_ID] The id of the service facility where the appointment will be rendered
        # @param date_of_service [Date] Expected date of service
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [ExpectedNetworkStatus::V2::ComputeAllInNetworkProvidersRequest]
        def initialize(service_type:, place_of_service_code:, subscriber_information:, patient_address:,
                       billing_provider_id:, organization_service_facility_id:, date_of_service:, additional_properties: nil)
          # @type [ExpectedNetworkStatus::V2::ServiceType] For some payers, payer routing depends on whether the rendered service qualifies as a behavioral health visit
          #   (e.g. Blue Shield of California routes to Magellan for behavioral health visits).
          #   For post appointment payer routing, Candid uses a CPT code list to determine whether the appointment qualifies as a
          #   behavioral health visit
          #   (see “Inputs: Service Type” in the appendix for list of qualifying CPT codes and behavioral health routing logic).
          #   Since CPT codes are not available pre-appointment, the service type input is used to determine whether the appointment is expected
          #   to qualify as behavioral health.
          @service_type = service_type
          # @type [Commons::FacilityTypeCode] Expected place of service
          @place_of_service_code = place_of_service_code
          # @type [ExpectedNetworkStatus::V2::ExpectedNetworkStatusSubscriberInformation] Information present on the patient's insurance card
          @subscriber_information = subscriber_information
          # @type [Commons::StreetAddressShortZip]
          @patient_address = patient_address
          # @type [OrganizationProviders::V2::ORGANIZATION_PROVIDER_ID]
          @billing_provider_id = billing_provider_id
          # @type [OrganizationServiceFacilities::V2::ORGANIZATION_SERVICE_FACILITY_ID] The id of the service facility where the appointment will be rendered
          @organization_service_facility_id = organization_service_facility_id
          # @type [Date] Expected date of service
          @date_of_service = date_of_service
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of ComputeAllInNetworkProvidersRequest
        #
        # @param json_object [JSON]
        # @return [ExpectedNetworkStatus::V2::ComputeAllInNetworkProvidersRequest]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          parsed_json = JSON.parse(json_object)
          service_type = struct.service_type
          place_of_service_code = struct.place_of_service_code
          if parsed_json["subscriber_information"].nil?
            subscriber_information = nil
          else
            subscriber_information = parsed_json["subscriber_information"].to_json
            subscriber_information = ExpectedNetworkStatus::V2::ExpectedNetworkStatusSubscriberInformation.from_json(json_object: subscriber_information)
          end
          if parsed_json["patient_address"].nil?
            patient_address = nil
          else
            patient_address = parsed_json["patient_address"].to_json
            patient_address = Commons::StreetAddressShortZip.from_json(json_object: patient_address)
          end
          billing_provider_id = struct.billing_provider_id
          organization_service_facility_id = struct.organization_service_facility_id
          date_of_service = (Date.parse(parsed_json["date_of_service"]) unless parsed_json["date_of_service"].nil?)
          new(service_type: service_type, place_of_service_code: place_of_service_code,
              subscriber_information: subscriber_information, patient_address: patient_address, billing_provider_id: billing_provider_id, organization_service_facility_id: organization_service_facility_id, date_of_service: date_of_service, additional_properties: struct)
        end

        # Serialize an instance of ComputeAllInNetworkProvidersRequest to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          {
            "service_type": @service_type,
            "place_of_service_code": @place_of_service_code,
            "subscriber_information": @subscriber_information,
            "patient_address": @patient_address,
            "billing_provider_id": @billing_provider_id,
            "organization_service_facility_id": @organization_service_facility_id,
            "date_of_service": @date_of_service
          }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          obj.service_type.is_a?(ExpectedNetworkStatus::V2::ServiceType) != false || raise("Passed value for field obj.service_type is not the expected type, validation failed.")
          obj.place_of_service_code.is_a?(Commons::FacilityTypeCode) != false || raise("Passed value for field obj.place_of_service_code is not the expected type, validation failed.")
          ExpectedNetworkStatus::V2::ExpectedNetworkStatusSubscriberInformation.validate_raw(obj: obj.subscriber_information)
          Commons::StreetAddressShortZip.validate_raw(obj: obj.patient_address)
          obj.billing_provider_id.is_a?(String) != false || raise("Passed value for field obj.billing_provider_id is not the expected type, validation failed.")
          obj.organization_service_facility_id.is_a?(String) != false || raise("Passed value for field obj.organization_service_facility_id is not the expected type, validation failed.")
          obj.date_of_service.is_a?(Date) != false || raise("Passed value for field obj.date_of_service is not the expected type, validation failed.")
        end
      end
    end
  end
end
