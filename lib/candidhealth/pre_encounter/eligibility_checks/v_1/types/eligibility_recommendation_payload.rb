# frozen_string_literal: true

require "json"
require_relative "medicare_advantage_recommendation"
require_relative "coordination_of_benefits_recommendation"

module CandidApiClient
  module PreEncounter
    module EligibilityChecks
      module V1
        module Types
          class EligibilityRecommendationPayload
            # @return [Object]
            attr_reader :member
            # @return [String]
            attr_reader :discriminant

            private_class_method :new
            alias kind_of? is_a?

            # @param member [Object]
            # @param discriminant [String]
            # @return [CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::EligibilityRecommendationPayload]
            def initialize(member:, discriminant:)
              @member = member
              @discriminant = discriminant
            end

            # Deserialize a JSON object to an instance of EligibilityRecommendationPayload
            #
            # @param json_object [String]
            # @return [CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::EligibilityRecommendationPayload]
            def self.from_json(json_object:)
              struct = JSON.parse(json_object, object_class: OpenStruct)
              case struct.type
              when "MEDICARE_ADVANTAGE"
                member = CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::MedicareAdvantageRecommendation.from_json(json_object: json_object)
              when "COORDINATION_OF_BENEFITS"
                member = CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::CoordinationOfBenefitsRecommendation.from_json(json_object: json_object)
              else
                member = CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::MedicareAdvantageRecommendation.from_json(json_object: json_object)
              end
              new(member: member, discriminant: struct.type)
            end

            # For Union Types, to_json functionality is delegated to the wrapped member.
            #
            # @return [String]
            def to_json(*_args)
              case @discriminant
              when "MEDICARE_ADVANTAGE"
                { **@member.to_json, type: @discriminant }.to_json
              when "COORDINATION_OF_BENEFITS"
                { **@member.to_json, type: @discriminant }.to_json
              else
                { "type": @discriminant, value: @member }.to_json
              end
              @member.to_json
            end

            # Leveraged for Union-type generation, validate_raw attempts to parse the given
            #  hash and check each fields type against the current object's property
            #  definitions.
            #
            # @param obj [Object]
            # @return [Void]
            def self.validate_raw(obj:)
              case obj.type
              when "MEDICARE_ADVANTAGE"
                CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::MedicareAdvantageRecommendation.validate_raw(obj: obj)
              when "COORDINATION_OF_BENEFITS"
                CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::CoordinationOfBenefitsRecommendation.validate_raw(obj: obj)
              else
                raise("Passed value matched no type within the union, validation failed.")
              end
            end

            # For Union Types, is_a? functionality is delegated to the wrapped member.
            #
            # @param obj [Object]
            # @return [Boolean]
            def is_a?(obj)
              @member.is_a?(obj)
            end

            # @param member [CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::MedicareAdvantageRecommendation]
            # @return [CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::EligibilityRecommendationPayload]
            def self.medicare_advantage(member:)
              new(member: member, discriminant: "MEDICARE_ADVANTAGE")
            end

            # @param member [CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::CoordinationOfBenefitsRecommendation]
            # @return [CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::EligibilityRecommendationPayload]
            def self.coordination_of_benefits(member:)
              new(member: member, discriminant: "COORDINATION_OF_BENEFITS")
            end
          end
        end
      end
    end
  end
end
