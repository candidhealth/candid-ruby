# frozen_string_literal: true

require_relative "patient_history_category_enum"
require_relative "intake_question_optional"
require "ostruct"
require "json"

module CandidApiClient
  module Encounters
    module V4
      module Types
        class PatientHistoryCategoryOptional
          # @return [CandidApiClient::Encounters::V4::Types::PatientHistoryCategoryEnum]
          attr_reader :category
          # @return [Array<CandidApiClient::Encounters::V4::Types::IntakeQuestionOptional>] Must contain at least one item.
          attr_reader :questions
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param category [CandidApiClient::Encounters::V4::Types::PatientHistoryCategoryEnum]
          # @param questions [Array<CandidApiClient::Encounters::V4::Types::IntakeQuestionOptional>] Must contain at least one item.
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::Encounters::V4::Types::PatientHistoryCategoryOptional]
          def initialize(category: OMIT, questions: OMIT, additional_properties: nil)
            @category = category if category != OMIT
            @questions = questions if questions != OMIT
            @additional_properties = additional_properties
            @_field_set = { "category": category, "questions": questions }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of PatientHistoryCategoryOptional
          #
          # @param json_object [String]
          # @return [CandidApiClient::Encounters::V4::Types::PatientHistoryCategoryOptional]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            category = struct["category"]
            questions = parsed_json["questions"]&.map do |item|
              item = item.to_json
              CandidApiClient::Encounters::V4::Types::IntakeQuestionOptional.from_json(json_object: item)
            end
            new(
              category: category,
              questions: questions,
              additional_properties: struct
            )
          end

          # Serialize an instance of PatientHistoryCategoryOptional to a JSON object
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
            obj.category&.is_a?(CandidApiClient::Encounters::V4::Types::PatientHistoryCategoryEnum) != false || raise("Passed value for field obj.category is not the expected type, validation failed.")
            obj.questions&.is_a?(Array) != false || raise("Passed value for field obj.questions is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
