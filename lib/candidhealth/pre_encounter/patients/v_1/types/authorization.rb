# frozen_string_literal: true

require_relative "../../../common/types/additional_payer_information"
require_relative "authorization_unit"
require_relative "../../../common/types/period"
require "ostruct"
require "json"

module CandidApiClient
  module PreEncounter
    module Patients
      module V1
        module Types
          class Authorization
            # @return [String]
            attr_reader :payer_id
            # @return [String]
            attr_reader :payer_name
            # @return [CandidApiClient::PreEncounter::Common::Types::AdditionalPayerInformation]
            attr_reader :additional_payer_information
            # @return [String]
            attr_reader :authorization_number
            # @return [String]
            attr_reader :cpt_code
            # @return [Boolean] If true, then the authorization will apply for all claims for the payer that
            #  fall in range the `period`.
            attr_reader :apply_for_all_cpt_codes
            # @return [Boolean] If true, indicates that prior authorization is not required and prior
            #  authorization number will not be set on the claim for this authorization.
            attr_reader :no_prior_authorization_required
            # @return [CandidApiClient::PreEncounter::Patients::V1::Types::AuthorizationUnit]
            attr_reader :units
            # @return [Integer]
            attr_reader :quantity
            # @return [CandidApiClient::PreEncounter::Common::Types::Period]
            attr_reader :period
            # @return [String]
            attr_reader :notes
            # @return [OpenStruct] Additional properties unmapped to the current class definition
            attr_reader :additional_properties
            # @return [Object]
            attr_reader :_field_set
            protected :_field_set

            OMIT = Object.new

            # @param payer_id [String]
            # @param payer_name [String]
            # @param additional_payer_information [CandidApiClient::PreEncounter::Common::Types::AdditionalPayerInformation]
            # @param authorization_number [String]
            # @param cpt_code [String]
            # @param apply_for_all_cpt_codes [Boolean] If true, then the authorization will apply for all claims for the payer that
            #  fall in range the `period`.
            # @param no_prior_authorization_required [Boolean] If true, indicates that prior authorization is not required and prior
            #  authorization number will not be set on the claim for this authorization.
            # @param units [CandidApiClient::PreEncounter::Patients::V1::Types::AuthorizationUnit]
            # @param quantity [Integer]
            # @param period [CandidApiClient::PreEncounter::Common::Types::Period]
            # @param notes [String]
            # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
            # @return [CandidApiClient::PreEncounter::Patients::V1::Types::Authorization]
            def initialize(payer_id:, payer_name:, authorization_number:, cpt_code:, units:,
                           additional_payer_information: OMIT, apply_for_all_cpt_codes: OMIT, no_prior_authorization_required: OMIT, quantity: OMIT, period: OMIT, notes: OMIT, additional_properties: nil)
              @payer_id = payer_id
              @payer_name = payer_name
              @additional_payer_information = additional_payer_information if additional_payer_information != OMIT
              @authorization_number = authorization_number
              @cpt_code = cpt_code
              @apply_for_all_cpt_codes = apply_for_all_cpt_codes if apply_for_all_cpt_codes != OMIT
              if no_prior_authorization_required != OMIT
                @no_prior_authorization_required = no_prior_authorization_required
              end
              @units = units
              @quantity = quantity if quantity != OMIT
              @period = period if period != OMIT
              @notes = notes if notes != OMIT
              @additional_properties = additional_properties
              @_field_set = {
                "payer_id": payer_id,
                "payer_name": payer_name,
                "additional_payer_information": additional_payer_information,
                "authorization_number": authorization_number,
                "cpt_code": cpt_code,
                "apply_for_all_cpt_codes": apply_for_all_cpt_codes,
                "no_prior_authorization_required": no_prior_authorization_required,
                "units": units,
                "quantity": quantity,
                "period": period,
                "notes": notes
              }.reject do |_k, v|
                v == OMIT
              end
            end

            # Deserialize a JSON object to an instance of Authorization
            #
            # @param json_object [String]
            # @return [CandidApiClient::PreEncounter::Patients::V1::Types::Authorization]
            def self.from_json(json_object:)
              struct = JSON.parse(json_object, object_class: OpenStruct)
              parsed_json = JSON.parse(json_object)
              payer_id = struct["payer_id"]
              payer_name = struct["payer_name"]
              if parsed_json["additional_payer_information"].nil?
                additional_payer_information = nil
              else
                additional_payer_information = parsed_json["additional_payer_information"].to_json
                additional_payer_information = CandidApiClient::PreEncounter::Common::Types::AdditionalPayerInformation.from_json(json_object: additional_payer_information)
              end
              authorization_number = struct["authorization_number"]
              cpt_code = struct["cpt_code"]
              apply_for_all_cpt_codes = struct["apply_for_all_cpt_codes"]
              no_prior_authorization_required = struct["no_prior_authorization_required"]
              units = struct["units"]
              quantity = struct["quantity"]
              if parsed_json["period"].nil?
                period = nil
              else
                period = parsed_json["period"].to_json
                period = CandidApiClient::PreEncounter::Common::Types::Period.from_json(json_object: period)
              end
              notes = struct["notes"]
              new(
                payer_id: payer_id,
                payer_name: payer_name,
                additional_payer_information: additional_payer_information,
                authorization_number: authorization_number,
                cpt_code: cpt_code,
                apply_for_all_cpt_codes: apply_for_all_cpt_codes,
                no_prior_authorization_required: no_prior_authorization_required,
                units: units,
                quantity: quantity,
                period: period,
                notes: notes,
                additional_properties: struct
              )
            end

            # Serialize an instance of Authorization to a JSON object
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
              obj.payer_id.is_a?(String) != false || raise("Passed value for field obj.payer_id is not the expected type, validation failed.")
              obj.payer_name.is_a?(String) != false || raise("Passed value for field obj.payer_name is not the expected type, validation failed.")
              obj.additional_payer_information.nil? || CandidApiClient::PreEncounter::Common::Types::AdditionalPayerInformation.validate_raw(obj: obj.additional_payer_information)
              obj.authorization_number.is_a?(String) != false || raise("Passed value for field obj.authorization_number is not the expected type, validation failed.")
              obj.cpt_code.is_a?(String) != false || raise("Passed value for field obj.cpt_code is not the expected type, validation failed.")
              obj.apply_for_all_cpt_codes&.is_a?(Boolean) != false || raise("Passed value for field obj.apply_for_all_cpt_codes is not the expected type, validation failed.")
              obj.no_prior_authorization_required&.is_a?(Boolean) != false || raise("Passed value for field obj.no_prior_authorization_required is not the expected type, validation failed.")
              obj.units.is_a?(CandidApiClient::PreEncounter::Patients::V1::Types::AuthorizationUnit) != false || raise("Passed value for field obj.units is not the expected type, validation failed.")
              obj.quantity&.is_a?(Integer) != false || raise("Passed value for field obj.quantity is not the expected type, validation failed.")
              obj.period.nil? || CandidApiClient::PreEncounter::Common::Types::Period.validate_raw(obj: obj.period)
              obj.notes&.is_a?(String) != false || raise("Passed value for field obj.notes is not the expected type, validation failed.")
            end
          end
        end
      end
    end
  end
end
