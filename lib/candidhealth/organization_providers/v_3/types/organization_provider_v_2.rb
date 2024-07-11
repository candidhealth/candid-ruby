# frozen_string_literal: true

require_relative "../../v_2/types/provider_type"
require_relative "../../v_2/types/license_type"
require_relative "../../v_2/types/organization_provider_address"
require "date"
require_relative "../../../identifiers/types/identifier"
require "ostruct"
require "json"

module CandidApiClient
  module OrganizationProviders
    module V3
      module Types
        class OrganizationProviderV2
          # @return [String] The NPI of the provider. This must be all digits [0-9] and exactly 10 characters
          #  long.
          attr_reader :npi
          # @return [Boolean] Whether the provider can be used to render services.
          attr_reader :is_rendering
          # @return [Boolean] Whether the provider can be used to bill services.
          attr_reader :is_billing
          # @return [String] The first name of the provider, if the provider is an individual.
          attr_reader :first_name
          # @return [String] The last name of the provider, if the provider is an individual.
          attr_reader :last_name
          # @return [String] The name of the provider, if the provider is an organization.
          attr_reader :organization_name
          # @return [CandidApiClient::OrganizationProviders::V2::Types::ProviderType] Whether the provider is an individual (NPPES Type 1) or organization (NPPES Type
          #  2) provider.
          attr_reader :provider_type
          # @return [String] If the provider has a contract with insurance, this must be the same tax ID
          #  given to the payer on an IRS W-9 form completed during contracting.
          attr_reader :tax_id
          # @return [String] A code designating classification and specialization.
          attr_reader :taxonomy_code
          # @return [CandidApiClient::OrganizationProviders::V2::Types::LicenseType] The type of license that the provider holds.
          attr_reader :license_type
          # @return [Array<CandidApiClient::OrganizationProviders::V2::Types::OrganizationProviderAddress>] The addresses associated with this provider.
          attr_reader :addresses
          # @return [Date] The employment start date for the provider.
          attr_reader :employment_start_date
          # @return [Date] The employment termination date for the provider.
          attr_reader :employment_termination_date
          # @return [String] Auto-generated ID set on creation.
          attr_reader :organization_provider_id
          # @return [Array<CandidApiClient::Identifiers::Types::Identifier>] Qualification given to a provider (PTAN, Medicaid Provider Id etc.).
          attr_reader :qualifications
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param npi [String] The NPI of the provider. This must be all digits [0-9] and exactly 10 characters
          #  long.
          # @param is_rendering [Boolean] Whether the provider can be used to render services.
          # @param is_billing [Boolean] Whether the provider can be used to bill services.
          # @param first_name [String] The first name of the provider, if the provider is an individual.
          # @param last_name [String] The last name of the provider, if the provider is an individual.
          # @param organization_name [String] The name of the provider, if the provider is an organization.
          # @param provider_type [CandidApiClient::OrganizationProviders::V2::Types::ProviderType] Whether the provider is an individual (NPPES Type 1) or organization (NPPES Type
          #  2) provider.
          # @param tax_id [String] If the provider has a contract with insurance, this must be the same tax ID
          #  given to the payer on an IRS W-9 form completed during contracting.
          # @param taxonomy_code [String] A code designating classification and specialization.
          # @param license_type [CandidApiClient::OrganizationProviders::V2::Types::LicenseType] The type of license that the provider holds.
          # @param addresses [Array<CandidApiClient::OrganizationProviders::V2::Types::OrganizationProviderAddress>] The addresses associated with this provider.
          # @param employment_start_date [Date] The employment start date for the provider.
          # @param employment_termination_date [Date] The employment termination date for the provider.
          # @param organization_provider_id [String] Auto-generated ID set on creation.
          # @param qualifications [Array<CandidApiClient::Identifiers::Types::Identifier>] Qualification given to a provider (PTAN, Medicaid Provider Id etc.).
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::OrganizationProviders::V3::Types::OrganizationProviderV2]
          def initialize(npi:, is_rendering:, is_billing:, provider_type:, license_type:, organization_provider_id:,
                         qualifications:, first_name: OMIT, last_name: OMIT, organization_name: OMIT, tax_id: OMIT, taxonomy_code: OMIT, addresses: OMIT, employment_start_date: OMIT, employment_termination_date: OMIT, additional_properties: nil)
            @npi = npi
            @is_rendering = is_rendering
            @is_billing = is_billing
            @first_name = first_name if first_name != OMIT
            @last_name = last_name if last_name != OMIT
            @organization_name = organization_name if organization_name != OMIT
            @provider_type = provider_type
            @tax_id = tax_id if tax_id != OMIT
            @taxonomy_code = taxonomy_code if taxonomy_code != OMIT
            @license_type = license_type
            @addresses = addresses if addresses != OMIT
            @employment_start_date = employment_start_date if employment_start_date != OMIT
            @employment_termination_date = employment_termination_date if employment_termination_date != OMIT
            @organization_provider_id = organization_provider_id
            @qualifications = qualifications
            @additional_properties = additional_properties
            @_field_set = {
              "npi": npi,
              "is_rendering": is_rendering,
              "is_billing": is_billing,
              "first_name": first_name,
              "last_name": last_name,
              "organization_name": organization_name,
              "provider_type": provider_type,
              "tax_id": tax_id,
              "taxonomy_code": taxonomy_code,
              "license_type": license_type,
              "addresses": addresses,
              "employment_start_date": employment_start_date,
              "employment_termination_date": employment_termination_date,
              "organization_provider_id": organization_provider_id,
              "qualifications": qualifications
            }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of OrganizationProviderV2
          #
          # @param json_object [String]
          # @return [CandidApiClient::OrganizationProviders::V3::Types::OrganizationProviderV2]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            npi = struct["npi"]
            is_rendering = struct["is_rendering"]
            is_billing = struct["is_billing"]
            first_name = struct["first_name"]
            last_name = struct["last_name"]
            organization_name = struct["organization_name"]
            provider_type = struct["provider_type"]
            tax_id = struct["tax_id"]
            taxonomy_code = struct["taxonomy_code"]
            license_type = struct["license_type"]
            addresses = parsed_json["addresses"]&.map do |item|
              item = item.to_json
              CandidApiClient::OrganizationProviders::V2::Types::OrganizationProviderAddress.from_json(json_object: item)
            end
            employment_start_date = unless parsed_json["employment_start_date"].nil?
                                      Date.parse(parsed_json["employment_start_date"])
                                    end
            employment_termination_date = unless parsed_json["employment_termination_date"].nil?
                                            Date.parse(parsed_json["employment_termination_date"])
                                          end
            organization_provider_id = struct["organization_provider_id"]
            qualifications = parsed_json["qualifications"]&.map do |item|
              item = item.to_json
              CandidApiClient::Identifiers::Types::Identifier.from_json(json_object: item)
            end
            new(
              npi: npi,
              is_rendering: is_rendering,
              is_billing: is_billing,
              first_name: first_name,
              last_name: last_name,
              organization_name: organization_name,
              provider_type: provider_type,
              tax_id: tax_id,
              taxonomy_code: taxonomy_code,
              license_type: license_type,
              addresses: addresses,
              employment_start_date: employment_start_date,
              employment_termination_date: employment_termination_date,
              organization_provider_id: organization_provider_id,
              qualifications: qualifications,
              additional_properties: struct
            )
          end

          # Serialize an instance of OrganizationProviderV2 to a JSON object
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
            obj.npi.is_a?(String) != false || raise("Passed value for field obj.npi is not the expected type, validation failed.")
            obj.is_rendering.is_a?(Boolean) != false || raise("Passed value for field obj.is_rendering is not the expected type, validation failed.")
            obj.is_billing.is_a?(Boolean) != false || raise("Passed value for field obj.is_billing is not the expected type, validation failed.")
            obj.first_name&.is_a?(String) != false || raise("Passed value for field obj.first_name is not the expected type, validation failed.")
            obj.last_name&.is_a?(String) != false || raise("Passed value for field obj.last_name is not the expected type, validation failed.")
            obj.organization_name&.is_a?(String) != false || raise("Passed value for field obj.organization_name is not the expected type, validation failed.")
            obj.provider_type.is_a?(CandidApiClient::OrganizationProviders::V2::Types::ProviderType) != false || raise("Passed value for field obj.provider_type is not the expected type, validation failed.")
            obj.tax_id&.is_a?(String) != false || raise("Passed value for field obj.tax_id is not the expected type, validation failed.")
            obj.taxonomy_code&.is_a?(String) != false || raise("Passed value for field obj.taxonomy_code is not the expected type, validation failed.")
            obj.license_type.is_a?(CandidApiClient::OrganizationProviders::V2::Types::LicenseType) != false || raise("Passed value for field obj.license_type is not the expected type, validation failed.")
            obj.addresses&.is_a?(Array) != false || raise("Passed value for field obj.addresses is not the expected type, validation failed.")
            obj.employment_start_date&.is_a?(Date) != false || raise("Passed value for field obj.employment_start_date is not the expected type, validation failed.")
            obj.employment_termination_date&.is_a?(Date) != false || raise("Passed value for field obj.employment_termination_date is not the expected type, validation failed.")
            obj.organization_provider_id.is_a?(String) != false || raise("Passed value for field obj.organization_provider_id is not the expected type, validation failed.")
            obj.qualifications.is_a?(Array) != false || raise("Passed value for field obj.qualifications is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
