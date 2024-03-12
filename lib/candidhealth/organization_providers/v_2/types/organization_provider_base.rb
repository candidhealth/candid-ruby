# frozen_string_literal: true

require_relative "provider_type"
require_relative "license_type"
require_relative "organization_provider_address"
require "json"

module CandidApiClient
  module OrganizationProviders
    module V2
      class OrganizationProviderBase
        attr_reader :npi, :is_rendering, :is_billing, :first_name, :last_name, :organization_name, :provider_type,
                    :tax_id, :taxonomy_code, :license_type, :ptan, :medicaid_provider_id, :addresses, :additional_properties

        # @param npi [String] The NPI of the provider. This must be all digits [0-9] and exactly 10 characters long.
        # @param is_rendering [Boolean] Whether the provider can be used to render services.
        # @param is_billing [Boolean] Whether the provider can be used to bill services.
        # @param first_name [String] The first name of the provider, if the provider is an individual.
        # @param last_name [String] The last name of the provider, if the provider is an individual.
        # @param organization_name [String] The name of the provider, if the provider is an organization.
        # @param provider_type [OrganizationProviders::V2::ProviderType] Whether the provider is an individual (NPPES Type 1) or organization (NPPES Type 2) provider.
        # @param tax_id [String] If the provider has a contract with insurance, this must be the same tax ID given to the payer on an IRS W-9 form completed during contracting.
        # @param taxonomy_code [String] A code designating classification and specialization.
        # @param license_type [OrganizationProviders::V2::LicenseType] The type of license that the provider holds.
        # @param ptan [String] The Provider Transaction Access Number for the provider.
        # @param medicaid_provider_id [String] The medicaid provider ID for the provider.
        # @param addresses [Array<OrganizationProviders::V2::OrganizationProviderAddress>] The addresses associated with this provider.
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [OrganizationProviders::V2::OrganizationProviderBase]
        def initialize(npi:, is_rendering:, is_billing:, provider_type:, license_type:, first_name: nil,
                       last_name: nil, organization_name: nil, tax_id: nil, taxonomy_code: nil, ptan: nil, medicaid_provider_id: nil, addresses: nil, additional_properties: nil)
          # @type [String] The NPI of the provider. This must be all digits [0-9] and exactly 10 characters long.
          @npi = npi
          # @type [Boolean] Whether the provider can be used to render services.
          @is_rendering = is_rendering
          # @type [Boolean] Whether the provider can be used to bill services.
          @is_billing = is_billing
          # @type [String] The first name of the provider, if the provider is an individual.
          @first_name = first_name
          # @type [String] The last name of the provider, if the provider is an individual.
          @last_name = last_name
          # @type [String] The name of the provider, if the provider is an organization.
          @organization_name = organization_name
          # @type [OrganizationProviders::V2::ProviderType] Whether the provider is an individual (NPPES Type 1) or organization (NPPES Type 2) provider.
          @provider_type = provider_type
          # @type [String] If the provider has a contract with insurance, this must be the same tax ID given to the payer on an IRS W-9 form completed during contracting.
          @tax_id = tax_id
          # @type [String] A code designating classification and specialization.
          @taxonomy_code = taxonomy_code
          # @type [OrganizationProviders::V2::LicenseType] The type of license that the provider holds.
          @license_type = license_type
          # @type [String] The Provider Transaction Access Number for the provider.
          @ptan = ptan
          # @type [String] The medicaid provider ID for the provider.
          @medicaid_provider_id = medicaid_provider_id
          # @type [Array<OrganizationProviders::V2::OrganizationProviderAddress>] The addresses associated with this provider.
          @addresses = addresses
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of OrganizationProviderBase
        #
        # @param json_object [JSON]
        # @return [OrganizationProviders::V2::OrganizationProviderBase]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          parsed_json = JSON.parse(json_object)
          npi = struct.npi
          is_rendering = struct.is_rendering
          is_billing = struct.is_billing
          first_name = struct.first_name
          last_name = struct.last_name
          organization_name = struct.organization_name
          provider_type = struct.provider_type
          tax_id = struct.tax_id
          taxonomy_code = struct.taxonomy_code
          license_type = struct.license_type
          ptan = struct.ptan
          medicaid_provider_id = struct.medicaid_provider_id
          addresses = parsed_json["addresses"]&.map do |v|
            v = v.to_json
            OrganizationProviders::V2::OrganizationProviderAddress.from_json(json_object: v)
          end
          new(npi: npi, is_rendering: is_rendering, is_billing: is_billing, first_name: first_name,
              last_name: last_name, organization_name: organization_name, provider_type: provider_type, tax_id: tax_id, taxonomy_code: taxonomy_code, license_type: license_type, ptan: ptan, medicaid_provider_id: medicaid_provider_id, addresses: addresses, additional_properties: struct)
        end

        # Serialize an instance of OrganizationProviderBase to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          {
            "npi": @npi,
            "is_rendering": @is_rendering,
            "is_billing": @is_billing,
            "first_name": @first_name,
            "last_name": @last_name,
            "organization_name": @organization_name,
            "provider_type": @provider_type,
            "tax_id": @tax_id,
            "taxonomy_code": @taxonomy_code,
            "license_type": @license_type,
            "ptan": @ptan,
            "medicaid_provider_id": @medicaid_provider_id,
            "addresses": @addresses
          }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
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
          obj.provider_type.is_a?(OrganizationProviders::V2::ProviderType) != false || raise("Passed value for field obj.provider_type is not the expected type, validation failed.")
          obj.tax_id&.is_a?(String) != false || raise("Passed value for field obj.tax_id is not the expected type, validation failed.")
          obj.taxonomy_code&.is_a?(String) != false || raise("Passed value for field obj.taxonomy_code is not the expected type, validation failed.")
          obj.license_type.is_a?(OrganizationProviders::V2::LicenseType) != false || raise("Passed value for field obj.license_type is not the expected type, validation failed.")
          obj.ptan&.is_a?(String) != false || raise("Passed value for field obj.ptan is not the expected type, validation failed.")
          obj.medicaid_provider_id&.is_a?(String) != false || raise("Passed value for field obj.medicaid_provider_id is not the expected type, validation failed.")
          obj.addresses&.is_a?(Array) != false || raise("Passed value for field obj.addresses is not the expected type, validation failed.")
        end
      end
    end
  end
end
