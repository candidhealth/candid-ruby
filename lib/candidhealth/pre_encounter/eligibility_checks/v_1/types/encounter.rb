# frozen_string_literal: true

require "date"
require "ostruct"
require "json"

module CandidApiClient
  module PreEncounter
    module EligibilityChecks
      module V1
        module Types
          class Encounter
            # @return [Date] Defaults to the current date if not provided.
            attr_reader :date_of_service
            # @return [Array<String>] Defaults to HealthBenefitPlanCoverage (30) if not provided.
            #  <Note>Not all payers support multiple service type codes, so it is recommended
            #  to only include a single code per request.</Note>
            attr_reader :service_type_codes
            # @return [OpenStruct] Additional properties unmapped to the current class definition
            attr_reader :additional_properties
            # @return [Object]
            attr_reader :_field_set
            protected :_field_set

            OMIT = Object.new

            # @param date_of_service [Date] Defaults to the current date if not provided.
            # @param service_type_codes [Array<String>] Defaults to HealthBenefitPlanCoverage (30) if not provided.
            #  <Note>Not all payers support multiple service type codes, so it is recommended
            #  to only include a single code per request.</Note>
            # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
            # @return [CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::Encounter]
            def initialize(date_of_service: OMIT, service_type_codes: OMIT, additional_properties: nil)
              @date_of_service = date_of_service if date_of_service != OMIT
              @service_type_codes = service_type_codes if service_type_codes != OMIT
              @additional_properties = additional_properties
              @_field_set = {
                "date_of_service": date_of_service,
                "service_type_codes": service_type_codes
              }.reject do |_k, v|
                v == OMIT
              end
            end

            # Deserialize a JSON object to an instance of Encounter
            #
            # @param json_object [String]
            # @return [CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::Encounter]
            def self.from_json(json_object:)
              struct = JSON.parse(json_object, object_class: OpenStruct)
              parsed_json = JSON.parse(json_object)
              date_of_service = (Date.parse(parsed_json["date_of_service"]) unless parsed_json["date_of_service"].nil?)
              service_type_codes = struct["service_type_codes"]
              new(
                date_of_service: date_of_service,
                service_type_codes: service_type_codes,
                additional_properties: struct
              )
            end

            # Serialize an instance of Encounter to a JSON object
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
              obj.date_of_service&.is_a?(Date) != false || raise("Passed value for field obj.date_of_service is not the expected type, validation failed.")
              obj.service_type_codes&.is_a?(Array) != false || raise("Passed value for field obj.service_type_codes is not the expected type, validation failed.")
            end
          end
        end
      end
    end
  end
end
