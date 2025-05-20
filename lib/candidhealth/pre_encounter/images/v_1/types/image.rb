# frozen_string_literal: true

require "date"
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
          # An Image object with immutable server-owned properties.
          class Image
            # @return [String]
            attr_reader :id
            # @return [String] A signed URL to the image.  This url can be used to upload an image to GCP
            #  storage or to read the image contents.
            attr_reader :signed_url
            # @return [String] The organization that owns this object.
            attr_reader :organization_id
            # @return [Boolean] True if the object is deactivated.  Deactivated objects are not returned in
            #  search results but are returned in all other endpoints including scan.
            attr_reader :deactivated
            # @return [Integer] The version of the object.  Any update to any property of an object object will
            #  create a new version.
            attr_reader :version
            # @return [DateTime]
            attr_reader :updated_at
            # @return [String] The user ID of the user who last updated the object.
            attr_reader :updating_user_id
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

            # @param id [String]
            # @param signed_url [String] A signed URL to the image.  This url can be used to upload an image to GCP
            #  storage or to read the image contents.
            # @param organization_id [String] The organization that owns this object.
            # @param deactivated [Boolean] True if the object is deactivated.  Deactivated objects are not returned in
            #  search results but are returned in all other endpoints including scan.
            # @param version [Integer] The version of the object.  Any update to any property of an object object will
            #  create a new version.
            # @param updated_at [DateTime]
            # @param updating_user_id [String] The user ID of the user who last updated the object.
            # @param file_name [String]
            # @param display_name [String]
            # @param file_type [String]
            # @param status [CandidApiClient::PreEncounter::Images::V1::Types::ImageStatus]
            # @param coverage [CandidApiClient::PreEncounter::Images::V1::Types::CoverageAssociation]
            # @param patient [CandidApiClient::PreEncounter::Images::V1::Types::PatientAssociation]
            # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
            # @return [CandidApiClient::PreEncounter::Images::V1::Types::Image]
            def initialize(id:, signed_url:, organization_id:, deactivated:, version:, updated_at:, updating_user_id:,
                           file_name:, display_name:, file_type:, status:, coverage: OMIT, patient: OMIT, additional_properties: nil)
              @id = id
              @signed_url = signed_url
              @organization_id = organization_id
              @deactivated = deactivated
              @version = version
              @updated_at = updated_at
              @updating_user_id = updating_user_id
              @file_name = file_name
              @display_name = display_name
              @file_type = file_type
              @status = status
              @coverage = coverage if coverage != OMIT
              @patient = patient if patient != OMIT
              @additional_properties = additional_properties
              @_field_set = {
                "id": id,
                "signed_url": signed_url,
                "organization_id": organization_id,
                "deactivated": deactivated,
                "version": version,
                "updated_at": updated_at,
                "updating_user_id": updating_user_id,
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

            # Deserialize a JSON object to an instance of Image
            #
            # @param json_object [String]
            # @return [CandidApiClient::PreEncounter::Images::V1::Types::Image]
            def self.from_json(json_object:)
              struct = JSON.parse(json_object, object_class: OpenStruct)
              parsed_json = JSON.parse(json_object)
              id = struct["id"]
              signed_url = struct["signed_url"]
              organization_id = struct["organization_id"]
              deactivated = struct["deactivated"]
              version = struct["version"]
              updated_at = (DateTime.parse(parsed_json["updated_at"]) unless parsed_json["updated_at"].nil?)
              updating_user_id = struct["updating_user_id"]
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
                id: id,
                signed_url: signed_url,
                organization_id: organization_id,
                deactivated: deactivated,
                version: version,
                updated_at: updated_at,
                updating_user_id: updating_user_id,
                file_name: file_name,
                display_name: display_name,
                file_type: file_type,
                status: status,
                coverage: coverage,
                patient: patient,
                additional_properties: struct
              )
            end

            # Serialize an instance of Image to a JSON object
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
              obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
              obj.signed_url.is_a?(String) != false || raise("Passed value for field obj.signed_url is not the expected type, validation failed.")
              obj.organization_id.is_a?(String) != false || raise("Passed value for field obj.organization_id is not the expected type, validation failed.")
              obj.deactivated.is_a?(Boolean) != false || raise("Passed value for field obj.deactivated is not the expected type, validation failed.")
              obj.version.is_a?(Integer) != false || raise("Passed value for field obj.version is not the expected type, validation failed.")
              obj.updated_at.is_a?(DateTime) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
              obj.updating_user_id.is_a?(String) != false || raise("Passed value for field obj.updating_user_id is not the expected type, validation failed.")
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
