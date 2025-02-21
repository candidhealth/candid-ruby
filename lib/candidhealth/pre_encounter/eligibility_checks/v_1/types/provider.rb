# frozen_string_literal: true

require "json"
require_relative "individual_provider"
require_relative "organization_provider"

module CandidApiClient
  module PreEncounter
    module EligibilityChecks
      module V1
        module Types
          class Provider
            # Deserialize a JSON object to an instance of Provider
            #
            # @param json_object [String]
            # @return [CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::Provider]
            def self.from_json(json_object:)
              struct = JSON.parse(json_object, object_class: OpenStruct)
              begin
                CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::IndividualProvider.validate_raw(obj: struct)
                unless json_object.nil?
                  return CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::IndividualProvider.from_json(json_object: json_object)
                end

                return nil
              rescue StandardError
                # noop
              end
              begin
                CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::OrganizationProvider.validate_raw(obj: struct)
                unless json_object.nil?
                  return CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::OrganizationProvider.from_json(json_object: json_object)
                end

                return nil
              rescue StandardError
                # noop
              end
              struct
            end

            # Leveraged for Union-type generation, validate_raw attempts to parse the given
            #  hash and check each fields type against the current object's property
            #  definitions.
            #
            # @param obj [Object]
            # @return [Void]
            def self.validate_raw(obj:)
              begin
                return CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::IndividualProvider.validate_raw(obj: obj)
              rescue StandardError
                # noop
              end
              begin
                return CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::OrganizationProvider.validate_raw(obj: obj)
              rescue StandardError
                # noop
              end
              raise("Passed value matched no type within the union, validation failed.")
            end
          end
        end
      end
    end
  end
end
