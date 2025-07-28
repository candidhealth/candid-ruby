# frozen_string_literal: true

require "ostruct"
require "json"

module CandidApiClient
  module PreEncounter
    module EligibilityChecks
      module V1
        module Types
          class StediPayer
            # @return [String]
            attr_reader :stedi_id
            # @return [String]
            attr_reader :display_name
            # @return [String]
            attr_reader :primary_payer_id
            # @return [Array<String>]
            attr_reader :aliases
            # @return [Array<String>]
            attr_reader :names
            # @return [Object]
            attr_reader :transaction_support
            # @return [Array<String>]
            attr_reader :employer_identification_numbers
            # @return [Object]
            attr_reader :payer_enrollment
            # @return [String]
            attr_reader :parent_payer_group
            # @return [Array<String>]
            attr_reader :coverage_types
            # @return [OpenStruct] Additional properties unmapped to the current class definition
            attr_reader :additional_properties
            # @return [Object]
            attr_reader :_field_set
            protected :_field_set

            OMIT = Object.new

            # @param stedi_id [String]
            # @param display_name [String]
            # @param primary_payer_id [String]
            # @param aliases [Array<String>]
            # @param names [Array<String>]
            # @param transaction_support [Object]
            # @param employer_identification_numbers [Array<String>]
            # @param payer_enrollment [Object]
            # @param parent_payer_group [String]
            # @param coverage_types [Array<String>]
            # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
            # @return [CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::StediPayer]
            def initialize(stedi_id:, display_name:, primary_payer_id:, aliases:, names:, transaction_support:, payer_enrollment:,
                           employer_identification_numbers: OMIT, parent_payer_group: OMIT, coverage_types: OMIT, additional_properties: nil)
              @stedi_id = stedi_id
              @display_name = display_name
              @primary_payer_id = primary_payer_id
              @aliases = aliases
              @names = names
              @transaction_support = transaction_support
              if employer_identification_numbers != OMIT
                @employer_identification_numbers = employer_identification_numbers
              end
              @payer_enrollment = payer_enrollment
              @parent_payer_group = parent_payer_group if parent_payer_group != OMIT
              @coverage_types = coverage_types if coverage_types != OMIT
              @additional_properties = additional_properties
              @_field_set = {
                "stedi_id": stedi_id,
                "display_name": display_name,
                "primary_payer_id": primary_payer_id,
                "aliases": aliases,
                "names": names,
                "transaction_support": transaction_support,
                "employer_identification_numbers": employer_identification_numbers,
                "payer_enrollment": payer_enrollment,
                "parent_payer_group": parent_payer_group,
                "coverage_types": coverage_types
              }.reject do |_k, v|
                v == OMIT
              end
            end

            # Deserialize a JSON object to an instance of StediPayer
            #
            # @param json_object [String]
            # @return [CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::StediPayer]
            def self.from_json(json_object:)
              struct = JSON.parse(json_object, object_class: OpenStruct)
              stedi_id = struct["stedi_id"]
              display_name = struct["display_name"]
              primary_payer_id = struct["primary_payer_id"]
              aliases = struct["aliases"]
              names = struct["names"]
              transaction_support = struct["transaction_support"]
              employer_identification_numbers = struct["employer_identification_numbers"]
              payer_enrollment = struct["payer_enrollment"]
              parent_payer_group = struct["parent_payer_group"]
              coverage_types = struct["coverage_types"]
              new(
                stedi_id: stedi_id,
                display_name: display_name,
                primary_payer_id: primary_payer_id,
                aliases: aliases,
                names: names,
                transaction_support: transaction_support,
                employer_identification_numbers: employer_identification_numbers,
                payer_enrollment: payer_enrollment,
                parent_payer_group: parent_payer_group,
                coverage_types: coverage_types,
                additional_properties: struct
              )
            end

            # Serialize an instance of StediPayer to a JSON object
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
              obj.stedi_id.is_a?(String) != false || raise("Passed value for field obj.stedi_id is not the expected type, validation failed.")
              obj.display_name.is_a?(String) != false || raise("Passed value for field obj.display_name is not the expected type, validation failed.")
              obj.primary_payer_id.is_a?(String) != false || raise("Passed value for field obj.primary_payer_id is not the expected type, validation failed.")
              obj.aliases.is_a?(Array) != false || raise("Passed value for field obj.aliases is not the expected type, validation failed.")
              obj.names.is_a?(Array) != false || raise("Passed value for field obj.names is not the expected type, validation failed.")
              obj.transaction_support.is_a?(Object) != false || raise("Passed value for field obj.transaction_support is not the expected type, validation failed.")
              obj.employer_identification_numbers&.is_a?(Array) != false || raise("Passed value for field obj.employer_identification_numbers is not the expected type, validation failed.")
              obj.payer_enrollment.is_a?(Object) != false || raise("Passed value for field obj.payer_enrollment is not the expected type, validation failed.")
              obj.parent_payer_group&.is_a?(String) != false || raise("Passed value for field obj.parent_payer_group is not the expected type, validation failed.")
              obj.coverage_types&.is_a?(Array) != false || raise("Passed value for field obj.coverage_types is not the expected type, validation failed.")
            end
          end
        end
      end
    end
  end
end
