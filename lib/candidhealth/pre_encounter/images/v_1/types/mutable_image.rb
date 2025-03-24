# frozen_string_literal: true

require_relative "image_status"
require_relative "coverage_association"
require_relative "patient_association"
require "ostruct"
require "json"

module CandidApiClient
  module PreEncounter
    module Images
      module V1
        module Types
          # An object representing an Image.
          class MutableImage
            # @return [String]
            attr_reader :file_name
            # @return [String]
            attr_reader :display_name
            # @return [String]
            attr_reader :file_type
            # @return [CandidApiClient::PreEncounter::Images::V1::Types::ImageStatus]
            attr_reader :status
            # @return [CandidApiClient::PreEncounter::Images::V1::Types::CoverageAssociation]
            attr_reader :coverage
            # @return [CandidApiClient::PreEncounter::Images::V1::Types::PatientAssociation]
            attr_reader :patient
            # @return [OpenStruct] Additional properties unmapped to the current class definition
            attr_reader :additional_properties
            # @return [Object]
            attr_reader :_field_set
            protected :_field_set

            OMIT = Object.new

            # @param file_name [String]
            # @param display_name [String]
            # @param file_type [String]
            # @param status [CandidApiClient::PreEncounter::Images::V1::Types::ImageStatus]
            # @param coverage [CandidApiClient::PreEncounter::Images::V1::Types::CoverageAssociation]
            # @param patient [CandidApiClient::PreEncounter::Images::V1::Types::PatientAssociation]
            # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
            # @return [CandidApiClient::PreEncounter::Images::V1::Types::MutableImage]
            def initialize(file_name:, display_name:, file_type:, status:, coverage: OMIT, patient: OMIT,
                           additional_properties: nil)
              @file_name = file_name
              @display_name = display_name
              @file_type = file_type
              @status = status
              @coverage = coverage if coverage != OMIT
              @patient = patient if patient != OMIT
              @additional_properties = additional_properties
              @_field_set = {
                "file_name": file_name,
                "display_name": display_name,
                "file_type": file_type,
                "status": status,
                "coverage": coverage,
                "patient": patient
              }.reject do |_k, v|
                v == OMIT
              end
            end

            # Deserialize a JSON object to an instance of MutableImage
            #
            # @param json_object [String]
            # @return [CandidApiClient::PreEncounter::Images::V1::Types::MutableImage]
            def self.from_json(json_object:)
              struct = JSON.parse(json_object, object_class: OpenStruct)
              parsed_json = JSON.parse(json_object)
              file_name = struct["file_name"]
              display_name = struct["display_name"]
              file_type = struct["file_type"]
              status = struct["status"]
              if parsed_json["coverage"].nil?
                coverage = nil
              else
                coverage = parsed_json["coverage"].to_json
                coverage = CandidApiClient::PreEncounter::Images::V1::Types::CoverageAssociation.from_json(json_object: coverage)
              end
              if parsed_json["patient"].nil?
                patient = nil
              else
                patient = parsed_json["patient"].to_json
                patient = CandidApiClient::PreEncounter::Images::V1::Types::PatientAssociation.from_json(json_object: patient)
              end
              new(
                file_name: file_name,
                display_name: display_name,
                file_type: file_type,
                status: status,
                coverage: coverage,
                patient: patient,
                additional_properties: struct
              )
            end

            # Serialize an instance of MutableImage to a JSON object
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
              obj.file_name.is_a?(String) != false || raise("Passed value for field obj.file_name is not the expected type, validation failed.")
              obj.display_name.is_a?(String) != false || raise("Passed value for field obj.display_name is not the expected type, validation failed.")
              obj.file_type.is_a?(String) != false || raise("Passed value for field obj.file_type is not the expected type, validation failed.")
              obj.status.is_a?(CandidApiClient::PreEncounter::Images::V1::Types::ImageStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
              obj.coverage.nil? || CandidApiClient::PreEncounter::Images::V1::Types::CoverageAssociation.validate_raw(obj: obj.coverage)
              obj.patient.nil? || CandidApiClient::PreEncounter::Images::V1::Types::PatientAssociation.validate_raw(obj: obj.patient)
            end
          end
        end
      end
    end
  end
end
