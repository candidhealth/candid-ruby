# frozen_string_literal: true

require_relative "human_name"
require_relative "external_provider_type"
require_relative "contact_point"
require_relative "address"
require_relative "period"
require "ostruct"
require "json"

module CandidApiClient
  module PreEncounter
    module Common
      module Types
        class ExternalProvider
          # @return [CandidApiClient::PreEncounter::Common::Types::HumanName]
          attr_reader :name
          # @return [CandidApiClient::PreEncounter::Common::Types::ExternalProviderType] Defaults to ATTENDING.
          attr_reader :type
          # @return [String]
          attr_reader :npi
          # @return [Array<CandidApiClient::PreEncounter::Common::Types::ContactPoint>]
          attr_reader :telecoms
          # @return [Array<CandidApiClient::PreEncounter::Common::Types::Address>]
          attr_reader :addresses
          # @return [CandidApiClient::PreEncounter::Common::Types::Period]
          attr_reader :period
          # @return [String]
          attr_reader :canonical_id
          # @return [String]
          attr_reader :fax
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param name [CandidApiClient::PreEncounter::Common::Types::HumanName]
          # @param type [CandidApiClient::PreEncounter::Common::Types::ExternalProviderType] Defaults to ATTENDING.
          # @param npi [String]
          # @param telecoms [Array<CandidApiClient::PreEncounter::Common::Types::ContactPoint>]
          # @param addresses [Array<CandidApiClient::PreEncounter::Common::Types::Address>]
          # @param period [CandidApiClient::PreEncounter::Common::Types::Period]
          # @param canonical_id [String]
          # @param fax [String]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::PreEncounter::Common::Types::ExternalProvider]
          def initialize(name:, telecoms:, type: OMIT, npi: OMIT, addresses: OMIT, period: OMIT, canonical_id: OMIT,
                         fax: OMIT, additional_properties: nil)
            @name = name
            @type = type if type != OMIT
            @npi = npi if npi != OMIT
            @telecoms = telecoms
            @addresses = addresses if addresses != OMIT
            @period = period if period != OMIT
            @canonical_id = canonical_id if canonical_id != OMIT
            @fax = fax if fax != OMIT
            @additional_properties = additional_properties
            @_field_set = {
              "name": name,
              "type": type,
              "npi": npi,
              "telecoms": telecoms,
              "addresses": addresses,
              "period": period,
              "canonical_id": canonical_id,
              "fax": fax
            }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of ExternalProvider
          #
          # @param json_object [String]
          # @return [CandidApiClient::PreEncounter::Common::Types::ExternalProvider]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            if parsed_json["name"].nil?
              name = nil
            else
              name = parsed_json["name"].to_json
              name = CandidApiClient::PreEncounter::Common::Types::HumanName.from_json(json_object: name)
            end
            type = struct["type"]
            npi = struct["npi"]
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
            canonical_id = struct["canonical_id"]
            fax = struct["fax"]
            new(
              name: name,
              type: type,
              npi: npi,
              telecoms: telecoms,
              addresses: addresses,
              period: period,
              canonical_id: canonical_id,
              fax: fax,
              additional_properties: struct
            )
          end

          # Serialize an instance of ExternalProvider to a JSON object
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
            CandidApiClient::PreEncounter::Common::Types::HumanName.validate_raw(obj: obj.name)
            obj.type&.is_a?(CandidApiClient::PreEncounter::Common::Types::ExternalProviderType) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
            obj.npi&.is_a?(String) != false || raise("Passed value for field obj.npi is not the expected type, validation failed.")
            obj.telecoms.is_a?(Array) != false || raise("Passed value for field obj.telecoms is not the expected type, validation failed.")
            obj.addresses&.is_a?(Array) != false || raise("Passed value for field obj.addresses is not the expected type, validation failed.")
            obj.period.nil? || CandidApiClient::PreEncounter::Common::Types::Period.validate_raw(obj: obj.period)
            obj.canonical_id&.is_a?(String) != false || raise("Passed value for field obj.canonical_id is not the expected type, validation failed.")
            obj.fax&.is_a?(String) != false || raise("Passed value for field obj.fax is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
