# frozen_string_literal: true

require_relative "patient_history_category_enum"
require_relative "intake_question"
require "json"

module CandidApiClient
  module Encounters
    module V4
      class PatientHistoryCategory
        attr_reader :category, :questions, :additional_properties

        # @param category [Encounters::V4::PatientHistoryCategoryEnum]
        # @param questions [Array<Encounters::V4::IntakeQuestion>] Must contain at least one item.
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [Encounters::V4::PatientHistoryCategory]
        def initialize(category:, questions:, additional_properties: nil)
          # @type [Encounters::V4::PatientHistoryCategoryEnum]
          @category = category
          # @type [Array<Encounters::V4::IntakeQuestion>] Must contain at least one item.
          @questions = questions
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of PatientHistoryCategory
        #
        # @param json_object [JSON]
        # @return [Encounters::V4::PatientHistoryCategory]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          parsed_json = JSON.parse(json_object)
          category = struct.category
          questions = parsed_json["questions"]&.map do |v|
            v = v.to_json
            Encounters::V4::IntakeQuestion.from_json(json_object: v)
          end
          new(category: category, questions: questions, additional_properties: struct)
        end

        # Serialize an instance of PatientHistoryCategory to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          { "category": @category, "questions": @questions }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          obj.category.is_a?(Encounters::V4::PatientHistoryCategoryEnum) != false || raise("Passed value for field obj.category is not the expected type, validation failed.")
          obj.questions.is_a?(Array) != false || raise("Passed value for field obj.questions is not the expected type, validation failed.")
        end
      end
    end
  end
end
