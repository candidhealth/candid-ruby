# frozen_string_literal: true

require_relative "../../../commons/types/emr_payer_crosswalk"
require_relative "../../../commons/types/source_of_payment_code"
require_relative "../../../commons/types/insurance_type_code"
require "ostruct"
require "json"

module CandidApiClient
  module InsuranceCards
    module V2
      module Types
        class InsuranceCardCreateOptional
          # @return [String]
          attr_reader :member_id
          # @return [String]
          attr_reader :payer_name
          # @return [String]
          attr_reader :payer_id
          # @return [String]
          attr_reader :rx_bin
          # @return [String]
          attr_reader :rx_pcn
          # @return [String]
          attr_reader :image_url_front
          # @return [String]
          attr_reader :image_url_back
          # @return [CandidApiClient::Commons::Types::EmrPayerCrosswalk]
          attr_reader :emr_payer_crosswalk
          # @return [String] Box 11 on the CMS-1500 claim form.
          attr_reader :group_number
          # @return [String] Box 11c on the CMS-1500 claim form.
          attr_reader :plan_name
          # @return [CandidApiClient::Commons::Types::SourceOfPaymentCode]
          attr_reader :plan_type
          # @return [CandidApiClient::Commons::Types::InsuranceTypeCode]
          attr_reader :insurance_type
          # @return [String]
          attr_reader :payer_plan_group_id
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param member_id [String]
          # @param payer_name [String]
          # @param payer_id [String]
          # @param rx_bin [String]
          # @param rx_pcn [String]
          # @param image_url_front [String]
          # @param image_url_back [String]
          # @param emr_payer_crosswalk [CandidApiClient::Commons::Types::EmrPayerCrosswalk]
          # @param group_number [String] Box 11 on the CMS-1500 claim form.
          # @param plan_name [String] Box 11c on the CMS-1500 claim form.
          # @param plan_type [CandidApiClient::Commons::Types::SourceOfPaymentCode]
          # @param insurance_type [CandidApiClient::Commons::Types::InsuranceTypeCode]
          # @param payer_plan_group_id [String]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::InsuranceCards::V2::Types::InsuranceCardCreateOptional]
          def initialize(member_id: OMIT, payer_name: OMIT, payer_id: OMIT, rx_bin: OMIT, rx_pcn: OMIT,
                         image_url_front: OMIT, image_url_back: OMIT, emr_payer_crosswalk: OMIT, group_number: OMIT, plan_name: OMIT, plan_type: OMIT, insurance_type: OMIT, payer_plan_group_id: OMIT, additional_properties: nil)
            @member_id = member_id if member_id != OMIT
            @payer_name = payer_name if payer_name != OMIT
            @payer_id = payer_id if payer_id != OMIT
            @rx_bin = rx_bin if rx_bin != OMIT
            @rx_pcn = rx_pcn if rx_pcn != OMIT
            @image_url_front = image_url_front if image_url_front != OMIT
            @image_url_back = image_url_back if image_url_back != OMIT
            @emr_payer_crosswalk = emr_payer_crosswalk if emr_payer_crosswalk != OMIT
            @group_number = group_number if group_number != OMIT
            @plan_name = plan_name if plan_name != OMIT
            @plan_type = plan_type if plan_type != OMIT
            @insurance_type = insurance_type if insurance_type != OMIT
            @payer_plan_group_id = payer_plan_group_id if payer_plan_group_id != OMIT
            @additional_properties = additional_properties
            @_field_set = {
              "member_id": member_id,
              "payer_name": payer_name,
              "payer_id": payer_id,
              "rx_bin": rx_bin,
              "rx_pcn": rx_pcn,
              "image_url_front": image_url_front,
              "image_url_back": image_url_back,
              "emr_payer_crosswalk": emr_payer_crosswalk,
              "group_number": group_number,
              "plan_name": plan_name,
              "plan_type": plan_type,
              "insurance_type": insurance_type,
              "payer_plan_group_id": payer_plan_group_id
            }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of InsuranceCardCreateOptional
          #
          # @param json_object [String]
          # @return [CandidApiClient::InsuranceCards::V2::Types::InsuranceCardCreateOptional]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            member_id = struct["member_id"]
            payer_name = struct["payer_name"]
            payer_id = struct["payer_id"]
            rx_bin = struct["rx_bin"]
            rx_pcn = struct["rx_pcn"]
            image_url_front = struct["image_url_front"]
            image_url_back = struct["image_url_back"]
            emr_payer_crosswalk = struct["emr_payer_crosswalk"]
            group_number = struct["group_number"]
            plan_name = struct["plan_name"]
            plan_type = struct["plan_type"]
            insurance_type = struct["insurance_type"]
            payer_plan_group_id = struct["payer_plan_group_id"]
            new(
              member_id: member_id,
              payer_name: payer_name,
              payer_id: payer_id,
              rx_bin: rx_bin,
              rx_pcn: rx_pcn,
              image_url_front: image_url_front,
              image_url_back: image_url_back,
              emr_payer_crosswalk: emr_payer_crosswalk,
              group_number: group_number,
              plan_name: plan_name,
              plan_type: plan_type,
              insurance_type: insurance_type,
              payer_plan_group_id: payer_plan_group_id,
              additional_properties: struct
            )
          end

          # Serialize an instance of InsuranceCardCreateOptional to a JSON object
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
            obj.member_id&.is_a?(String) != false || raise("Passed value for field obj.member_id is not the expected type, validation failed.")
            obj.payer_name&.is_a?(String) != false || raise("Passed value for field obj.payer_name is not the expected type, validation failed.")
            obj.payer_id&.is_a?(String) != false || raise("Passed value for field obj.payer_id is not the expected type, validation failed.")
            obj.rx_bin&.is_a?(String) != false || raise("Passed value for field obj.rx_bin is not the expected type, validation failed.")
            obj.rx_pcn&.is_a?(String) != false || raise("Passed value for field obj.rx_pcn is not the expected type, validation failed.")
            obj.image_url_front&.is_a?(String) != false || raise("Passed value for field obj.image_url_front is not the expected type, validation failed.")
            obj.image_url_back&.is_a?(String) != false || raise("Passed value for field obj.image_url_back is not the expected type, validation failed.")
            obj.emr_payer_crosswalk&.is_a?(CandidApiClient::Commons::Types::EmrPayerCrosswalk) != false || raise("Passed value for field obj.emr_payer_crosswalk is not the expected type, validation failed.")
            obj.group_number&.is_a?(String) != false || raise("Passed value for field obj.group_number is not the expected type, validation failed.")
            obj.plan_name&.is_a?(String) != false || raise("Passed value for field obj.plan_name is not the expected type, validation failed.")
            obj.plan_type&.is_a?(CandidApiClient::Commons::Types::SourceOfPaymentCode) != false || raise("Passed value for field obj.plan_type is not the expected type, validation failed.")
            obj.insurance_type&.is_a?(CandidApiClient::Commons::Types::InsuranceTypeCode) != false || raise("Passed value for field obj.insurance_type is not the expected type, validation failed.")
            obj.payer_plan_group_id&.is_a?(String) != false || raise("Passed value for field obj.payer_plan_group_id is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
