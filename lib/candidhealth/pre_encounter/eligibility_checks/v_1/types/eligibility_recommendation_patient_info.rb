# frozen_string_literal: true

require "date"
require "ostruct"
require "json"

module CandidApiClient
  module PreEncounter
    module EligibilityChecks
      module V1
        module Types
          # An object representing patient information for an eligibility recommendation.
          #  This is used to find recommendations. Each field helps us find the right
          #  corresponding
          #  eligibility recommendation for the patient.
          class EligibilityRecommendationPatientInfo
            # @return [String]
            attr_reader :id
            # @return [String]
            attr_reader :mrn
            # @return [String]
            attr_reader :organization_id
            # @return [String]
            attr_reader :last_name
            # @return [String]
            attr_reader :first_name
            # @return [Date]
            attr_reader :date_of_birth
            # @return [String]
            attr_reader :member_id
            # @return [OpenStruct] Additional properties unmapped to the current class definition
            attr_reader :additional_properties
            # @return [Object]
            attr_reader :_field_set
            protected :_field_set

            OMIT = Object.new

            # @param id [String]
            # @param mrn [String]
            # @param organization_id [String]
            # @param last_name [String]
            # @param first_name [String]
            # @param date_of_birth [Date]
            # @param member_id [String]
            # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
            # @return [CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::EligibilityRecommendationPatientInfo]
            def initialize(id: OMIT, mrn: OMIT, organization_id: OMIT, last_name: OMIT, first_name: OMIT,
                           date_of_birth: OMIT, member_id: OMIT, additional_properties: nil)
              @id = id if id != OMIT
              @mrn = mrn if mrn != OMIT
              @organization_id = organization_id if organization_id != OMIT
              @last_name = last_name if last_name != OMIT
              @first_name = first_name if first_name != OMIT
              @date_of_birth = date_of_birth if date_of_birth != OMIT
              @member_id = member_id if member_id != OMIT
              @additional_properties = additional_properties
              @_field_set = {
                "id": id,
                "mrn": mrn,
                "organization_id": organization_id,
                "last_name": last_name,
                "first_name": first_name,
                "date_of_birth": date_of_birth,
                "member_id": member_id
              }.reject do |_k, v|
                v == OMIT
              end
            end

            # Deserialize a JSON object to an instance of EligibilityRecommendationPatientInfo
            #
            # @param json_object [String]
            # @return [CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::EligibilityRecommendationPatientInfo]
            def self.from_json(json_object:)
              struct = JSON.parse(json_object, object_class: OpenStruct)
              parsed_json = JSON.parse(json_object)
              id = struct["id"]
              mrn = struct["mrn"]
              organization_id = struct["organization_id"]
              last_name = struct["last_name"]
              first_name = struct["first_name"]
              date_of_birth = (Date.parse(parsed_json["date_of_birth"]) unless parsed_json["date_of_birth"].nil?)
              member_id = struct["member_id"]
              new(
                id: id,
                mrn: mrn,
                organization_id: organization_id,
                last_name: last_name,
                first_name: first_name,
                date_of_birth: date_of_birth,
                member_id: member_id,
                additional_properties: struct
              )
            end

            # Serialize an instance of EligibilityRecommendationPatientInfo to a JSON object
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
              obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
              obj.mrn&.is_a?(String) != false || raise("Passed value for field obj.mrn is not the expected type, validation failed.")
              obj.organization_id&.is_a?(String) != false || raise("Passed value for field obj.organization_id is not the expected type, validation failed.")
              obj.last_name&.is_a?(String) != false || raise("Passed value for field obj.last_name is not the expected type, validation failed.")
              obj.first_name&.is_a?(String) != false || raise("Passed value for field obj.first_name is not the expected type, validation failed.")
              obj.date_of_birth&.is_a?(Date) != false || raise("Passed value for field obj.date_of_birth is not the expected type, validation failed.")
              obj.member_id&.is_a?(String) != false || raise("Passed value for field obj.member_id is not the expected type, validation failed.")
            end
          end
        end
      end
    end
  end
end
