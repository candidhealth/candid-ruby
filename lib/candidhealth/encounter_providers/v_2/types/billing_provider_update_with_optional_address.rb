# frozen_string_literal: true

require_relative "../../../commons/types/street_address_short_zip_optional"
require_relative "../../../commons/types/billing_provider_commercial_license_type"
require "ostruct"
require "json"

module CandidApiClient
  module EncounterProviders
    module V2
      module Types
        # The billing provider is the provider or business entity submitting the claim.
        #  Billing provider may be, but is not necessarily, the same person/NPI as the
        #  rendering provider.
        #  From a payer's perspective, this represents the person or entity being
        #  reimbursed.
        #  When a contract exists with the target payer, the billing provider should be the
        #  entity contracted with the payer.
        #  In some circumstances, this will be an individual provider. In that case, submit
        #  that provider's NPI and the
        #  tax ID (TIN) that the provider gave to the payer during contracting.
        #  In other cases, the billing entity will be a medical group. If so, submit the
        #  group NPI and the group's tax ID.
        #  Box 33 on the CMS-1500 claim form.
        #  The address fields here are optional.
        class BillingProviderUpdateWithOptionalAddress
          # @return [CandidApiClient::Commons::Types::StreetAddressShortZipOptional]
          attr_reader :address
          # @return [String] If the provider has a contract with insurance, this must be the same tax ID
          #  given to the payer on an IRS W-9 form completed during contracting.
          attr_reader :tax_id
          # @return [String]
          attr_reader :npi
          # @return [String]
          attr_reader :taxonomy_code
          # @return [CandidApiClient::Commons::Types::BillingProviderCommercialLicenseType] 837i Loop2010BB G2
          #  Provider Commercial Number
          attr_reader :provider_commercial_license_type
          # @return [String] If the provider is an individual, this should be set instead of organization
          #  name
          attr_reader :first_name
          # @return [String] If the provider is an individual, this should be set instead of organization
          #  name
          attr_reader :last_name
          # @return [String] If the provider is an organization, this should be set instead of first + last
          #  name
          attr_reader :organization_name
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param address [CandidApiClient::Commons::Types::StreetAddressShortZipOptional]
          # @param tax_id [String] If the provider has a contract with insurance, this must be the same tax ID
          #  given to the payer on an IRS W-9 form completed during contracting.
          # @param npi [String]
          # @param taxonomy_code [String]
          # @param provider_commercial_license_type [CandidApiClient::Commons::Types::BillingProviderCommercialLicenseType] 837i Loop2010BB G2
          #  Provider Commercial Number
          # @param first_name [String] If the provider is an individual, this should be set instead of organization
          #  name
          # @param last_name [String] If the provider is an individual, this should be set instead of organization
          #  name
          # @param organization_name [String] If the provider is an organization, this should be set instead of first + last
          #  name
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::EncounterProviders::V2::Types::BillingProviderUpdateWithOptionalAddress]
          def initialize(address: OMIT, tax_id: OMIT, npi: OMIT, taxonomy_code: OMIT,
                         provider_commercial_license_type: OMIT, first_name: OMIT, last_name: OMIT, organization_name: OMIT, additional_properties: nil)
            @address = address if address != OMIT
            @tax_id = tax_id if tax_id != OMIT
            @npi = npi if npi != OMIT
            @taxonomy_code = taxonomy_code if taxonomy_code != OMIT
            if provider_commercial_license_type != OMIT
              @provider_commercial_license_type = provider_commercial_license_type
            end
            @first_name = first_name if first_name != OMIT
            @last_name = last_name if last_name != OMIT
            @organization_name = organization_name if organization_name != OMIT
            @additional_properties = additional_properties
            @_field_set = {
              "address": address,
              "tax_id": tax_id,
              "npi": npi,
              "taxonomy_code": taxonomy_code,
              "provider_commercial_license_type": provider_commercial_license_type,
              "first_name": first_name,
              "last_name": last_name,
              "organization_name": organization_name
            }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of
          #  BillingProviderUpdateWithOptionalAddress
          #
          # @param json_object [String]
          # @return [CandidApiClient::EncounterProviders::V2::Types::BillingProviderUpdateWithOptionalAddress]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            if parsed_json["address"].nil?
              address = nil
            else
              address = parsed_json["address"].to_json
              address = CandidApiClient::Commons::Types::StreetAddressShortZipOptional.from_json(json_object: address)
            end
            tax_id = struct["tax_id"]
            npi = struct["npi"]
            taxonomy_code = struct["taxonomy_code"]
            provider_commercial_license_type = struct["provider_commercial_license_type"]
            first_name = struct["first_name"]
            last_name = struct["last_name"]
            organization_name = struct["organization_name"]
            new(
              address: address,
              tax_id: tax_id,
              npi: npi,
              taxonomy_code: taxonomy_code,
              provider_commercial_license_type: provider_commercial_license_type,
              first_name: first_name,
              last_name: last_name,
              organization_name: organization_name,
              additional_properties: struct
            )
          end

          # Serialize an instance of BillingProviderUpdateWithOptionalAddress to a JSON
          #  object
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
            obj.address.nil? || CandidApiClient::Commons::Types::StreetAddressShortZipOptional.validate_raw(obj: obj.address)
            obj.tax_id&.is_a?(String) != false || raise("Passed value for field obj.tax_id is not the expected type, validation failed.")
            obj.npi&.is_a?(String) != false || raise("Passed value for field obj.npi is not the expected type, validation failed.")
            obj.taxonomy_code&.is_a?(String) != false || raise("Passed value for field obj.taxonomy_code is not the expected type, validation failed.")
            obj.provider_commercial_license_type&.is_a?(CandidApiClient::Commons::Types::BillingProviderCommercialLicenseType) != false || raise("Passed value for field obj.provider_commercial_license_type is not the expected type, validation failed.")
            obj.first_name&.is_a?(String) != false || raise("Passed value for field obj.first_name is not the expected type, validation failed.")
            obj.last_name&.is_a?(String) != false || raise("Passed value for field obj.last_name is not the expected type, validation failed.")
            obj.organization_name&.is_a?(String) != false || raise("Passed value for field obj.organization_name is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
