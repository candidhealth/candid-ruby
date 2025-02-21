# frozen_string_literal: true

require_relative "eligibility_request"
require_relative "parsed_response"
require_relative "request_correction"
require "ostruct"
require "json"

module CandidApiClient
  module PreEncounter
    module EligibilityChecks
      module V1
        module Types
          class EligibilityCheck
            # @return [Object]
            attr_reader :errors
            # @return [CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::EligibilityRequest]
            attr_reader :request
            # @return [Object]
            attr_reader :response
            # @return [CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::ParsedResponse]
            attr_reader :parsed_response
            # @return [Array<CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::RequestCorrection>]
            attr_reader :request_corrections
            # @return [OpenStruct] Additional properties unmapped to the current class definition
            attr_reader :additional_properties
            # @return [Object]
            attr_reader :_field_set
            protected :_field_set

            OMIT = Object.new

            # @param errors [Object]
            # @param request [CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::EligibilityRequest]
            # @param response [Object]
            # @param parsed_response [CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::ParsedResponse]
            # @param request_corrections [Array<CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::RequestCorrection>]
            # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
            # @return [CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::EligibilityCheck]
            def initialize(response:, errors: OMIT, request: OMIT, parsed_response: OMIT, request_corrections: OMIT,
                           additional_properties: nil)
              @errors = errors if errors != OMIT
              @request = request if request != OMIT
              @response = response
              @parsed_response = parsed_response if parsed_response != OMIT
              @request_corrections = request_corrections if request_corrections != OMIT
              @additional_properties = additional_properties
              @_field_set = {
                "errors": errors,
                "request": request,
                "response": response,
                "parsed_response": parsed_response,
                "request_corrections": request_corrections
              }.reject do |_k, v|
                v == OMIT
              end
            end

            # Deserialize a JSON object to an instance of EligibilityCheck
            #
            # @param json_object [String]
            # @return [CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::EligibilityCheck]
            def self.from_json(json_object:)
              struct = JSON.parse(json_object, object_class: OpenStruct)
              parsed_json = JSON.parse(json_object)
              errors = struct["errors"]
              if parsed_json["request"].nil?
                request = nil
              else
                request = parsed_json["request"].to_json
                request = CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::EligibilityRequest.from_json(json_object: request)
              end
              response = struct["response"]
              if parsed_json["parsed_response"].nil?
                parsed_response = nil
              else
                parsed_response = parsed_json["parsed_response"].to_json
                parsed_response = CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::ParsedResponse.from_json(json_object: parsed_response)
              end
              request_corrections = parsed_json["request_corrections"]&.map do |item|
                item = item.to_json
                CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::RequestCorrection.from_json(json_object: item)
              end
              new(
                errors: errors,
                request: request,
                response: response,
                parsed_response: parsed_response,
                request_corrections: request_corrections,
                additional_properties: struct
              )
            end

            # Serialize an instance of EligibilityCheck to a JSON object
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
              obj.errors&.is_a?(Object) != false || raise("Passed value for field obj.errors is not the expected type, validation failed.")
              obj.request.nil? || CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::EligibilityRequest.validate_raw(obj: obj.request)
              obj.response.is_a?(Object) != false || raise("Passed value for field obj.response is not the expected type, validation failed.")
              obj.parsed_response.nil? || CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::ParsedResponse.validate_raw(obj: obj.parsed_response)
              obj.request_corrections&.is_a?(Array) != false || raise("Passed value for field obj.request_corrections is not the expected type, validation failed.")
            end
          end
        end
      end
    end
  end
end
