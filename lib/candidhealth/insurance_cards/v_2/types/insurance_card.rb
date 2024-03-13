# frozen_string_literal: true

require_relative "insurance_card_id"
require_relative "../../../commons/types/source_of_payment_code"
require_relative "../../../commons/types/insurance_type_code"
require "json"

module CandidApiClient
  module InsuranceCards
    module V2
      class InsuranceCard
        attr_reader :insurance_card_id, :member_id, :payer_name, :payer_id, :rx_bin, :rx_pcn, :image_url_front,
                    :image_url_back, :group_number, :plan_name, :plan_type, :insurance_type, :additional_properties

        # @param insurance_card_id [InsuranceCards::V2::INSURANCE_CARD_ID]
        # @param member_id [String]
        # @param payer_name [String]
        # @param payer_id [String]
        # @param rx_bin [String]
        # @param rx_pcn [String]
        # @param image_url_front [String]
        # @param image_url_back [String]
        # @param group_number [String] Box 11 on the CMS-1500 claim form.
        # @param plan_name [String] Box 11c on the CMS-1500 claim form.
        # @param plan_type [Commons::SourceOfPaymentCode]
        # @param insurance_type [Commons::InsuranceTypeCode]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [InsuranceCards::V2::InsuranceCard]
        def initialize(insurance_card_id:, member_id:, payer_name:, payer_id:, rx_bin: nil, rx_pcn: nil,
                       image_url_front: nil, image_url_back: nil, group_number: nil, plan_name: nil, plan_type: nil, insurance_type: nil, additional_properties: nil)
          # @type [InsuranceCards::V2::INSURANCE_CARD_ID]
          @insurance_card_id = insurance_card_id
          # @type [String]
          @member_id = member_id
          # @type [String]
          @payer_name = payer_name
          # @type [String]
          @payer_id = payer_id
          # @type [String]
          @rx_bin = rx_bin
          # @type [String]
          @rx_pcn = rx_pcn
          # @type [String]
          @image_url_front = image_url_front
          # @type [String]
          @image_url_back = image_url_back
          # @type [String] Box 11 on the CMS-1500 claim form.
          @group_number = group_number
          # @type [String] Box 11c on the CMS-1500 claim form.
          @plan_name = plan_name
          # @type [Commons::SourceOfPaymentCode]
          @plan_type = plan_type
          # @type [Commons::InsuranceTypeCode]
          @insurance_type = insurance_type
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of InsuranceCard
        #
        # @param json_object [JSON]
        # @return [InsuranceCards::V2::InsuranceCard]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          JSON.parse(json_object)
          insurance_card_id = struct.insurance_card_id
          member_id = struct.member_id
          payer_name = struct.payer_name
          payer_id = struct.payer_id
          rx_bin = struct.rx_bin
          rx_pcn = struct.rx_pcn
          image_url_front = struct.image_url_front
          image_url_back = struct.image_url_back
          group_number = struct.group_number
          plan_name = struct.plan_name
          plan_type = struct.plan_type
          insurance_type = struct.insurance_type
          new(insurance_card_id: insurance_card_id, member_id: member_id, payer_name: payer_name, payer_id: payer_id,
              rx_bin: rx_bin, rx_pcn: rx_pcn, image_url_front: image_url_front, image_url_back: image_url_back, group_number: group_number, plan_name: plan_name, plan_type: plan_type, insurance_type: insurance_type, additional_properties: struct)
        end

        # Serialize an instance of InsuranceCard to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          {
            "insurance_card_id": @insurance_card_id,
            "member_id": @member_id,
            "payer_name": @payer_name,
            "payer_id": @payer_id,
            "rx_bin": @rx_bin,
            "rx_pcn": @rx_pcn,
            "image_url_front": @image_url_front,
            "image_url_back": @image_url_back,
            "group_number": @group_number,
            "plan_name": @plan_name,
            "plan_type": @plan_type,
            "insurance_type": @insurance_type
          }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          obj.insurance_card_id.is_a?(String) != false || raise("Passed value for field obj.insurance_card_id is not the expected type, validation failed.")
          obj.member_id.is_a?(String) != false || raise("Passed value for field obj.member_id is not the expected type, validation failed.")
          obj.payer_name.is_a?(String) != false || raise("Passed value for field obj.payer_name is not the expected type, validation failed.")
          obj.payer_id.is_a?(String) != false || raise("Passed value for field obj.payer_id is not the expected type, validation failed.")
          obj.rx_bin&.is_a?(String) != false || raise("Passed value for field obj.rx_bin is not the expected type, validation failed.")
          obj.rx_pcn&.is_a?(String) != false || raise("Passed value for field obj.rx_pcn is not the expected type, validation failed.")
          obj.image_url_front&.is_a?(String) != false || raise("Passed value for field obj.image_url_front is not the expected type, validation failed.")
          obj.image_url_back&.is_a?(String) != false || raise("Passed value for field obj.image_url_back is not the expected type, validation failed.")
          obj.group_number&.is_a?(String) != false || raise("Passed value for field obj.group_number is not the expected type, validation failed.")
          obj.plan_name&.is_a?(String) != false || raise("Passed value for field obj.plan_name is not the expected type, validation failed.")
          obj.plan_type&.is_a?(Commons::SourceOfPaymentCode) != false || raise("Passed value for field obj.plan_type is not the expected type, validation failed.")
          obj.insurance_type&.is_a?(Commons::InsuranceTypeCode) != false || raise("Passed value for field obj.insurance_type is not the expected type, validation failed.")
        end
      end
    end
  end
end
