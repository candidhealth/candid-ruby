# frozen_string_literal: true

require_relative "../../../requests"
require_relative "types/referring_provider_update"
require_relative "types/encounter_provider"
require_relative "types/initial_referring_provider_update"
require_relative "types/supervising_provider_update"
require_relative "types/ordering_provider_update"
require_relative "types/referring_provider"
require_relative "types/initial_referring_provider"
require_relative "types/supervising_provider"
require_relative "types/ordering_provider"
require "async"

module CandidApiClient
  module EncounterProviders
    module V2
      class V2Client
        # @return [CandidApiClient::RequestClient]
        attr_reader :request_client

        # @param request_client [CandidApiClient::RequestClient]
        # @return [CandidApiClient::EncounterProviders::V2::V2Client]
        def initialize(request_client:)
          @request_client = request_client
        end

        # @param encounter_id [String]
        # @param request [Hash] Request of type CandidApiClient::EncounterProviders::V2::Types::ReferringProviderUpdate, as a Hash
        #   * :npi (String)
        #   * :taxonomy_code (String)
        #   * :address (Hash)
        #     * :zip_plus_four_code (String)
        #     * :address_1 (String)
        #     * :address_2 (String)
        #     * :city (String)
        #     * :state (CandidApiClient::Commons::Types::State)
        #     * :zip_code (String)
        #   * :first_name (String)
        #   * :last_name (String)
        #   * :organization_name (String)
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::EncounterProviders::V2::Types::EncounterProvider]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.encounter_providers.v_2.update_referring_provider(encounter_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", request: {  })
        def update_referring_provider(encounter_id:, request:, request_options: nil)
          response = @request_client.conn.patch do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/encounter-providers/v2/#{encounter_id}"
          end
          CandidApiClient::EncounterProviders::V2::Types::EncounterProvider.from_json(json_object: response.body)
        end

        # @param encounter_id [String]
        # @param request [Hash] Request of type CandidApiClient::EncounterProviders::V2::Types::InitialReferringProviderUpdate, as a Hash
        #   * :npi (String)
        #   * :taxonomy_code (String)
        #   * :address (Hash)
        #     * :zip_plus_four_code (String)
        #     * :address_1 (String)
        #     * :address_2 (String)
        #     * :city (String)
        #     * :state (CandidApiClient::Commons::Types::State)
        #     * :zip_code (String)
        #   * :qualifier (CandidApiClient::Commons::Types::QualifierCode)
        #   * :first_name (String)
        #   * :last_name (String)
        #   * :organization_name (String)
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::EncounterProviders::V2::Types::EncounterProvider]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.encounter_providers.v_2.update_initial_referring_provider(encounter_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", request: {  })
        def update_initial_referring_provider(encounter_id:, request:, request_options: nil)
          response = @request_client.conn.patch do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/encounter-providers/v2/#{encounter_id}/initial-referring-provider"
          end
          CandidApiClient::EncounterProviders::V2::Types::EncounterProvider.from_json(json_object: response.body)
        end

        # @param encounter_id [String]
        # @param request [Hash] Request of type CandidApiClient::EncounterProviders::V2::Types::SupervisingProviderUpdate, as a Hash
        #   * :npi (String)
        #   * :taxonomy_code (String)
        #   * :address (Hash)
        #     * :zip_plus_four_code (String)
        #     * :address_1 (String)
        #     * :address_2 (String)
        #     * :city (String)
        #     * :state (CandidApiClient::Commons::Types::State)
        #     * :zip_code (String)
        #   * :first_name (String)
        #   * :last_name (String)
        #   * :organization_name (String)
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::EncounterProviders::V2::Types::EncounterProvider]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.encounter_providers.v_2.update_supervising_provider(encounter_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", request: {  })
        def update_supervising_provider(encounter_id:, request:, request_options: nil)
          response = @request_client.conn.patch do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/encounter-providers/v2/#{encounter_id}/supervising-provider"
          end
          CandidApiClient::EncounterProviders::V2::Types::EncounterProvider.from_json(json_object: response.body)
        end

        # @param service_line_id [String]
        # @param request [Hash] Request of type CandidApiClient::EncounterProviders::V2::Types::OrderingProviderUpdate, as a Hash
        #   * :npi (String)
        #   * :taxonomy_code (String)
        #   * :address (Hash)
        #     * :zip_plus_four_code (String)
        #     * :address_1 (String)
        #     * :address_2 (String)
        #     * :city (String)
        #     * :state (CandidApiClient::Commons::Types::State)
        #     * :zip_code (String)
        #   * :first_name (String)
        #   * :last_name (String)
        #   * :organization_name (String)
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::EncounterProviders::V2::Types::EncounterProvider]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.encounter_providers.v_2.update_ordering_provider(service_line_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", request: { npi: "string", taxonomy_code: "string", address: { address_1: "123 Main St", address_2: "Apt 1", city: "New York", state: NY, zip_code: "10001", zip_plus_four_code: "1234" } })
        def update_ordering_provider(service_line_id:, request:, request_options: nil)
          response = @request_client.conn.patch do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/encounter-providers/v2/#{service_line_id}/ordering-provider"
          end
          CandidApiClient::EncounterProviders::V2::Types::EncounterProvider.from_json(json_object: response.body)
        end

        # @param encounter_id [String]
        # @param request [Hash] Request of type CandidApiClient::EncounterProviders::V2::Types::ReferringProvider, as a Hash
        #   * :npi (String)
        #   * :taxonomy_code (String)
        #   * :address (Hash)
        #     * :zip_plus_four_code (String)
        #     * :address_1 (String)
        #     * :address_2 (String)
        #     * :city (String)
        #     * :state (CandidApiClient::Commons::Types::State)
        #     * :zip_code (String)
        #   * :first_name (String)
        #   * :last_name (String)
        #   * :organization_name (String)
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::EncounterProviders::V2::Types::EncounterProvider]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.encounter_providers.v_2.create_referring_provider(encounter_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", request: { npi: "string", taxonomy_code: "string", address: { address_1: "123 Main St", address_2: "Apt 1", city: "New York", state: NY, zip_code: "10001", zip_plus_four_code: "1234" } })
        def create_referring_provider(encounter_id:, request:, request_options: nil)
          response = @request_client.conn.post do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/encounter-providers/v2/#{encounter_id}/create-referring-provider"
          end
          CandidApiClient::EncounterProviders::V2::Types::EncounterProvider.from_json(json_object: response.body)
        end

        # @param encounter_id [String]
        # @param request [Hash] Request of type CandidApiClient::EncounterProviders::V2::Types::InitialReferringProvider, as a Hash
        #   * :npi (String)
        #   * :taxonomy_code (String)
        #   * :address (Hash)
        #     * :zip_plus_four_code (String)
        #     * :address_1 (String)
        #     * :address_2 (String)
        #     * :city (String)
        #     * :state (CandidApiClient::Commons::Types::State)
        #     * :zip_code (String)
        #   * :qualifier (CandidApiClient::Commons::Types::QualifierCode)
        #   * :first_name (String)
        #   * :last_name (String)
        #   * :organization_name (String)
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::EncounterProviders::V2::Types::EncounterProvider]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.encounter_providers.v_2.create_initial_referring_provider(encounter_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", request: { npi: "string", taxonomy_code: "string", address: { address_1: "123 Main St", address_2: "Apt 1", city: "New York", state: NY, zip_code: "10001", zip_plus_four_code: "1234" }, qualifier: DQ })
        def create_initial_referring_provider(encounter_id:, request:, request_options: nil)
          response = @request_client.conn.post do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/encounter-providers/v2/#{encounter_id}/create-initial-referring-provider"
          end
          CandidApiClient::EncounterProviders::V2::Types::EncounterProvider.from_json(json_object: response.body)
        end

        # @param encounter_id [String]
        # @param request [Hash] Request of type CandidApiClient::EncounterProviders::V2::Types::SupervisingProvider, as a Hash
        #   * :npi (String)
        #   * :taxonomy_code (String)
        #   * :address (Hash)
        #     * :zip_plus_four_code (String)
        #     * :address_1 (String)
        #     * :address_2 (String)
        #     * :city (String)
        #     * :state (CandidApiClient::Commons::Types::State)
        #     * :zip_code (String)
        #   * :first_name (String)
        #   * :last_name (String)
        #   * :organization_name (String)
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::EncounterProviders::V2::Types::EncounterProvider]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.encounter_providers.v_2.create_supervising_provider(encounter_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", request: { npi: "string", taxonomy_code: "string", address: { address_1: "123 Main St", address_2: "Apt 1", city: "New York", state: NY, zip_code: "10001", zip_plus_four_code: "1234" } })
        def create_supervising_provider(encounter_id:, request:, request_options: nil)
          response = @request_client.conn.post do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/encounter-providers/v2/#{encounter_id}/create-supervising-provider"
          end
          CandidApiClient::EncounterProviders::V2::Types::EncounterProvider.from_json(json_object: response.body)
        end

        # @param service_line_id [String]
        # @param request [Hash] Request of type CandidApiClient::EncounterProviders::V2::Types::OrderingProvider, as a Hash
        #   * :npi (String)
        #   * :taxonomy_code (String)
        #   * :address (Hash)
        #     * :zip_plus_four_code (String)
        #     * :address_1 (String)
        #     * :address_2 (String)
        #     * :city (String)
        #     * :state (CandidApiClient::Commons::Types::State)
        #     * :zip_code (String)
        #   * :first_name (String)
        #   * :last_name (String)
        #   * :organization_name (String)
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::EncounterProviders::V2::Types::EncounterProvider]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.encounter_providers.v_2.create_ordering_provider(service_line_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", request: { npi: "string", taxonomy_code: "string", address: { address_1: "123 Main St", address_2: "Apt 1", city: "New York", state: NY, zip_code: "10001", zip_plus_four_code: "1234" } })
        def create_ordering_provider(service_line_id:, request:, request_options: nil)
          response = @request_client.conn.post do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/encounter-providers/v2/#{service_line_id}/create-ordering-provider"
          end
          CandidApiClient::EncounterProviders::V2::Types::EncounterProvider.from_json(json_object: response.body)
        end

        # @param encounter_id [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [Void]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.encounter_providers.v_2.delete_referring_provider(encounter_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def delete_referring_provider(encounter_id:, request_options: nil)
          @request_client.conn.delete do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/encounter-providers/v2/#{encounter_id}/referring-provider"
          end
        end

        # @param encounter_id [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [Void]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.encounter_providers.v_2.delete_initial_referring_provider(encounter_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def delete_initial_referring_provider(encounter_id:, request_options: nil)
          @request_client.conn.delete do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/encounter-providers/v2/#{encounter_id}/initial-referring-provider"
          end
        end

        # @param encounter_id [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [Void]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.encounter_providers.v_2.delete_supervising_provider(encounter_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def delete_supervising_provider(encounter_id:, request_options: nil)
          @request_client.conn.delete do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/encounter-providers/v2/#{encounter_id}/supervising-provider"
          end
        end

        # @param service_line_id [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [Void]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.encounter_providers.v_2.delete_ordering_provider(service_line_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def delete_ordering_provider(service_line_id:, request_options: nil)
          @request_client.conn.delete do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/encounter-providers/v2/#{service_line_id}/ordering-provider"
          end
        end
      end

      class AsyncV2Client
        # @return [CandidApiClient::AsyncRequestClient]
        attr_reader :request_client

        # @param request_client [CandidApiClient::AsyncRequestClient]
        # @return [CandidApiClient::EncounterProviders::V2::AsyncV2Client]
        def initialize(request_client:)
          @request_client = request_client
        end

        # @param encounter_id [String]
        # @param request [Hash] Request of type CandidApiClient::EncounterProviders::V2::Types::ReferringProviderUpdate, as a Hash
        #   * :npi (String)
        #   * :taxonomy_code (String)
        #   * :address (Hash)
        #     * :zip_plus_four_code (String)
        #     * :address_1 (String)
        #     * :address_2 (String)
        #     * :city (String)
        #     * :state (CandidApiClient::Commons::Types::State)
        #     * :zip_code (String)
        #   * :first_name (String)
        #   * :last_name (String)
        #   * :organization_name (String)
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::EncounterProviders::V2::Types::EncounterProvider]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.encounter_providers.v_2.update_referring_provider(encounter_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", request: {  })
        def update_referring_provider(encounter_id:, request:, request_options: nil)
          Async do
            response = @request_client.conn.patch do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
              req.url "#{@request_client.get_url(environment: CandidApi,
                                                 request_options: request_options)}/api/encounter-providers/v2/#{encounter_id}"
            end
            CandidApiClient::EncounterProviders::V2::Types::EncounterProvider.from_json(json_object: response.body)
          end
        end

        # @param encounter_id [String]
        # @param request [Hash] Request of type CandidApiClient::EncounterProviders::V2::Types::InitialReferringProviderUpdate, as a Hash
        #   * :npi (String)
        #   * :taxonomy_code (String)
        #   * :address (Hash)
        #     * :zip_plus_four_code (String)
        #     * :address_1 (String)
        #     * :address_2 (String)
        #     * :city (String)
        #     * :state (CandidApiClient::Commons::Types::State)
        #     * :zip_code (String)
        #   * :qualifier (CandidApiClient::Commons::Types::QualifierCode)
        #   * :first_name (String)
        #   * :last_name (String)
        #   * :organization_name (String)
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::EncounterProviders::V2::Types::EncounterProvider]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.encounter_providers.v_2.update_initial_referring_provider(encounter_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", request: {  })
        def update_initial_referring_provider(encounter_id:, request:, request_options: nil)
          Async do
            response = @request_client.conn.patch do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
              req.url "#{@request_client.get_url(environment: CandidApi,
                                                 request_options: request_options)}/api/encounter-providers/v2/#{encounter_id}/initial-referring-provider"
            end
            CandidApiClient::EncounterProviders::V2::Types::EncounterProvider.from_json(json_object: response.body)
          end
        end

        # @param encounter_id [String]
        # @param request [Hash] Request of type CandidApiClient::EncounterProviders::V2::Types::SupervisingProviderUpdate, as a Hash
        #   * :npi (String)
        #   * :taxonomy_code (String)
        #   * :address (Hash)
        #     * :zip_plus_four_code (String)
        #     * :address_1 (String)
        #     * :address_2 (String)
        #     * :city (String)
        #     * :state (CandidApiClient::Commons::Types::State)
        #     * :zip_code (String)
        #   * :first_name (String)
        #   * :last_name (String)
        #   * :organization_name (String)
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::EncounterProviders::V2::Types::EncounterProvider]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.encounter_providers.v_2.update_supervising_provider(encounter_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", request: {  })
        def update_supervising_provider(encounter_id:, request:, request_options: nil)
          Async do
            response = @request_client.conn.patch do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
              req.url "#{@request_client.get_url(environment: CandidApi,
                                                 request_options: request_options)}/api/encounter-providers/v2/#{encounter_id}/supervising-provider"
            end
            CandidApiClient::EncounterProviders::V2::Types::EncounterProvider.from_json(json_object: response.body)
          end
        end

        # @param service_line_id [String]
        # @param request [Hash] Request of type CandidApiClient::EncounterProviders::V2::Types::OrderingProviderUpdate, as a Hash
        #   * :npi (String)
        #   * :taxonomy_code (String)
        #   * :address (Hash)
        #     * :zip_plus_four_code (String)
        #     * :address_1 (String)
        #     * :address_2 (String)
        #     * :city (String)
        #     * :state (CandidApiClient::Commons::Types::State)
        #     * :zip_code (String)
        #   * :first_name (String)
        #   * :last_name (String)
        #   * :organization_name (String)
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::EncounterProviders::V2::Types::EncounterProvider]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.encounter_providers.v_2.update_ordering_provider(service_line_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", request: { npi: "string", taxonomy_code: "string", address: { address_1: "123 Main St", address_2: "Apt 1", city: "New York", state: NY, zip_code: "10001", zip_plus_four_code: "1234" } })
        def update_ordering_provider(service_line_id:, request:, request_options: nil)
          Async do
            response = @request_client.conn.patch do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
              req.url "#{@request_client.get_url(environment: CandidApi,
                                                 request_options: request_options)}/api/encounter-providers/v2/#{service_line_id}/ordering-provider"
            end
            CandidApiClient::EncounterProviders::V2::Types::EncounterProvider.from_json(json_object: response.body)
          end
        end

        # @param encounter_id [String]
        # @param request [Hash] Request of type CandidApiClient::EncounterProviders::V2::Types::ReferringProvider, as a Hash
        #   * :npi (String)
        #   * :taxonomy_code (String)
        #   * :address (Hash)
        #     * :zip_plus_four_code (String)
        #     * :address_1 (String)
        #     * :address_2 (String)
        #     * :city (String)
        #     * :state (CandidApiClient::Commons::Types::State)
        #     * :zip_code (String)
        #   * :first_name (String)
        #   * :last_name (String)
        #   * :organization_name (String)
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::EncounterProviders::V2::Types::EncounterProvider]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.encounter_providers.v_2.create_referring_provider(encounter_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", request: { npi: "string", taxonomy_code: "string", address: { address_1: "123 Main St", address_2: "Apt 1", city: "New York", state: NY, zip_code: "10001", zip_plus_four_code: "1234" } })
        def create_referring_provider(encounter_id:, request:, request_options: nil)
          Async do
            response = @request_client.conn.post do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
              req.url "#{@request_client.get_url(environment: CandidApi,
                                                 request_options: request_options)}/api/encounter-providers/v2/#{encounter_id}/create-referring-provider"
            end
            CandidApiClient::EncounterProviders::V2::Types::EncounterProvider.from_json(json_object: response.body)
          end
        end

        # @param encounter_id [String]
        # @param request [Hash] Request of type CandidApiClient::EncounterProviders::V2::Types::InitialReferringProvider, as a Hash
        #   * :npi (String)
        #   * :taxonomy_code (String)
        #   * :address (Hash)
        #     * :zip_plus_four_code (String)
        #     * :address_1 (String)
        #     * :address_2 (String)
        #     * :city (String)
        #     * :state (CandidApiClient::Commons::Types::State)
        #     * :zip_code (String)
        #   * :qualifier (CandidApiClient::Commons::Types::QualifierCode)
        #   * :first_name (String)
        #   * :last_name (String)
        #   * :organization_name (String)
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::EncounterProviders::V2::Types::EncounterProvider]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.encounter_providers.v_2.create_initial_referring_provider(encounter_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", request: { npi: "string", taxonomy_code: "string", address: { address_1: "123 Main St", address_2: "Apt 1", city: "New York", state: NY, zip_code: "10001", zip_plus_four_code: "1234" }, qualifier: DQ })
        def create_initial_referring_provider(encounter_id:, request:, request_options: nil)
          Async do
            response = @request_client.conn.post do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
              req.url "#{@request_client.get_url(environment: CandidApi,
                                                 request_options: request_options)}/api/encounter-providers/v2/#{encounter_id}/create-initial-referring-provider"
            end
            CandidApiClient::EncounterProviders::V2::Types::EncounterProvider.from_json(json_object: response.body)
          end
        end

        # @param encounter_id [String]
        # @param request [Hash] Request of type CandidApiClient::EncounterProviders::V2::Types::SupervisingProvider, as a Hash
        #   * :npi (String)
        #   * :taxonomy_code (String)
        #   * :address (Hash)
        #     * :zip_plus_four_code (String)
        #     * :address_1 (String)
        #     * :address_2 (String)
        #     * :city (String)
        #     * :state (CandidApiClient::Commons::Types::State)
        #     * :zip_code (String)
        #   * :first_name (String)
        #   * :last_name (String)
        #   * :organization_name (String)
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::EncounterProviders::V2::Types::EncounterProvider]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.encounter_providers.v_2.create_supervising_provider(encounter_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", request: { npi: "string", taxonomy_code: "string", address: { address_1: "123 Main St", address_2: "Apt 1", city: "New York", state: NY, zip_code: "10001", zip_plus_four_code: "1234" } })
        def create_supervising_provider(encounter_id:, request:, request_options: nil)
          Async do
            response = @request_client.conn.post do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
              req.url "#{@request_client.get_url(environment: CandidApi,
                                                 request_options: request_options)}/api/encounter-providers/v2/#{encounter_id}/create-supervising-provider"
            end
            CandidApiClient::EncounterProviders::V2::Types::EncounterProvider.from_json(json_object: response.body)
          end
        end

        # @param service_line_id [String]
        # @param request [Hash] Request of type CandidApiClient::EncounterProviders::V2::Types::OrderingProvider, as a Hash
        #   * :npi (String)
        #   * :taxonomy_code (String)
        #   * :address (Hash)
        #     * :zip_plus_four_code (String)
        #     * :address_1 (String)
        #     * :address_2 (String)
        #     * :city (String)
        #     * :state (CandidApiClient::Commons::Types::State)
        #     * :zip_code (String)
        #   * :first_name (String)
        #   * :last_name (String)
        #   * :organization_name (String)
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::EncounterProviders::V2::Types::EncounterProvider]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.encounter_providers.v_2.create_ordering_provider(service_line_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", request: { npi: "string", taxonomy_code: "string", address: { address_1: "123 Main St", address_2: "Apt 1", city: "New York", state: NY, zip_code: "10001", zip_plus_four_code: "1234" } })
        def create_ordering_provider(service_line_id:, request:, request_options: nil)
          Async do
            response = @request_client.conn.post do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
              req.url "#{@request_client.get_url(environment: CandidApi,
                                                 request_options: request_options)}/api/encounter-providers/v2/#{service_line_id}/create-ordering-provider"
            end
            CandidApiClient::EncounterProviders::V2::Types::EncounterProvider.from_json(json_object: response.body)
          end
        end

        # @param encounter_id [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [Void]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.encounter_providers.v_2.delete_referring_provider(encounter_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def delete_referring_provider(encounter_id:, request_options: nil)
          Async do
            @request_client.conn.delete do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.url "#{@request_client.get_url(environment: CandidApi,
                                                 request_options: request_options)}/api/encounter-providers/v2/#{encounter_id}/referring-provider"
            end
          end
        end

        # @param encounter_id [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [Void]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.encounter_providers.v_2.delete_initial_referring_provider(encounter_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def delete_initial_referring_provider(encounter_id:, request_options: nil)
          Async do
            @request_client.conn.delete do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.url "#{@request_client.get_url(environment: CandidApi,
                                                 request_options: request_options)}/api/encounter-providers/v2/#{encounter_id}/initial-referring-provider"
            end
          end
        end

        # @param encounter_id [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [Void]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.encounter_providers.v_2.delete_supervising_provider(encounter_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def delete_supervising_provider(encounter_id:, request_options: nil)
          Async do
            @request_client.conn.delete do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.url "#{@request_client.get_url(environment: CandidApi,
                                                 request_options: request_options)}/api/encounter-providers/v2/#{encounter_id}/supervising-provider"
            end
          end
        end

        # @param service_line_id [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [Void]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.encounter_providers.v_2.delete_ordering_provider(service_line_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def delete_ordering_provider(service_line_id:, request_options: nil)
          Async do
            @request_client.conn.delete do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.url "#{@request_client.get_url(environment: CandidApi,
                                                 request_options: request_options)}/api/encounter-providers/v2/#{service_line_id}/ordering-provider"
            end
          end
        end
      end
    end
  end
end
