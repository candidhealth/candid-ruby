# frozen_string_literal: true

require_relative "../../../common/types/relationship"
require_relative "../../../common/types/human_name"
require_relative "../../../common/types/contact_point"
require_relative "../../../common/types/address"
require_relative "../../../common/types/period"
require "ostruct"
require "json"

module CandidApiClient
  module PreEncounter
    module Patients
      module V1
        module Types
          class Contact
            # @return [Array<CandidApiClient::PreEncounter::Common::Types::Relationship>]
            attr_reader :relationship
            # @return [CandidApiClient::PreEncounter::Common::Types::HumanName]
            attr_reader :name
            # @return [Array<CandidApiClient::PreEncounter::Common::Types::ContactPoint>]
            attr_reader :telecoms
            # @return [Array<CandidApiClient::PreEncounter::Common::Types::Address>]
            attr_reader :addresses
            # @return [CandidApiClient::PreEncounter::Common::Types::Period]
            attr_reader :period
            # @return [Boolean]
            attr_reader :hipaa_authorization
            # @return [OpenStruct] Additional properties unmapped to the current class definition
            attr_reader :additional_properties
            # @return [Object]
            attr_reader :_field_set
            protected :_field_set

            OMIT = Object.new

            # @param relationship [Array<CandidApiClient::PreEncounter::Common::Types::Relationship>]
            # @param name [CandidApiClient::PreEncounter::Common::Types::HumanName]
            # @param telecoms [Array<CandidApiClient::PreEncounter::Common::Types::ContactPoint>]
            # @param addresses [Array<CandidApiClient::PreEncounter::Common::Types::Address>]
            # @param period [CandidApiClient::PreEncounter::Common::Types::Period]
            # @param hipaa_authorization [Boolean]
            # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
            # @return [CandidApiClient::PreEncounter::Patients::V1::Types::Contact]
            def initialize(relationship:, name:, telecoms:, addresses:, period: OMIT, hipaa_authorization: OMIT,
                           additional_properties: nil)
              @relationship = relationship
              @name = name
              @telecoms = telecoms
              @addresses = addresses
              @period = period if period != OMIT
              @hipaa_authorization = hipaa_authorization if hipaa_authorization != OMIT
              @additional_properties = additional_properties
              @_field_set = {
                "relationship": relationship,
                "name": name,
                "telecoms": telecoms,
                "addresses": addresses,
                "period": period,
                "hipaa_authorization": hipaa_authorization
              }.reject do |_k, v|
                v == OMIT
              end
            end

            # Deserialize a JSON object to an instance of Contact
            #
            # @param json_object [String]
            # @return [CandidApiClient::PreEncounter::Patients::V1::Types::Contact]
            def self.from_json(json_object:)
              struct = JSON.parse(json_object, object_class: OpenStruct)
              parsed_json = JSON.parse(json_object)
              relationship = struct["relationship"]
              if parsed_json["name"].nil?
                name = nil
              else
                name = parsed_json["name"].to_json
                name = CandidApiClient::PreEncounter::Common::Types::HumanName.from_json(json_object: name)
              end
              telecoms = parsed_json["telecoms"]&.map do |item|
                item = item.to_json
                CandidApiClient::PreEncounter::Common::Types::ContactPoint.from_json(json_object: item)
              end
              addresses = parsed_json["addresses"]&.map do |item|
                item = item.to_json
                CandidApiClient::PreEncounter::Common::Types::Address.from_json(json_object: item)
              end
              if parsed_json["period"].nil?
                period = nil
              else
                period = parsed_json["period"].to_json
                period = CandidApiClient::PreEncounter::Common::Types::Period.from_json(json_object: period)
              end
              hipaa_authorization = struct["hipaa_authorization"]
              new(
                relationship: relationship,
                name: name,
                telecoms: telecoms,
                addresses: addresses,
                period: period,
                hipaa_authorization: hipaa_authorization,
                additional_properties: struct
              )
            end

            # Serialize an instance of Contact to a JSON object
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
              obj.relationship.is_a?(Array) != false || raise("Passed value for field obj.relationship is not the expected type, validation failed.")
              CandidApiClient::PreEncounter::Common::Types::HumanName.validate_raw(obj: obj.name)
              obj.telecoms.is_a?(Array) != false || raise("Passed value for field obj.telecoms is not the expected type, validation failed.")
              obj.addresses.is_a?(Array) != false || raise("Passed value for field obj.addresses is not the expected type, validation failed.")
              obj.period.nil? || CandidApiClient::PreEncounter::Common::Types::Period.validate_raw(obj: obj.period)
              obj.hipaa_authorization&.is_a?(Boolean) != false || raise("Passed value for field obj.hipaa_authorization is not the expected type, validation failed.")
            end
          end
        end
      end
    end
  end
end
