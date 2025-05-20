# frozen_string_literal: true

require_relative "../../../requests"
require "date"
require_relative "../../commons/types/regions"
require_relative "types/provider_credentialing_span"
require_relative "types/provider_credentialing_span_page"
require "async"

module CandidApiClient
  module Credentialing
    module V2
      class V2Client
        # @return [CandidApiClient::RequestClient]
        attr_reader :request_client

        # @param request_client [CandidApiClient::RequestClient]
        # @return [CandidApiClient::Credentialing::V2::V2Client]
        def initialize(request_client:)
          @request_client = request_client
        end

        # @param rendering_provider_id [String] The ID of the rendering provider covered by the credentialing span.
        # @param contracting_provider_id [String] The ID of the practice location at which the rendering provider is covered by
        #  the credentialing span.
        # @param payer_uuid [String] The ID of the payer covered by the credentialing span.
        # @param start_date [Date] Start date of the credentialing span.
        # @param end_date [Date] End date of the credentialing span.
        # @param regions [CandidApiClient::Commons::Types::Regions] The states covered by the credentialing span. A span may be national and cover
        #  all states.
        # @param submitted_date [Date] Date that the credential paperwork was submitted.
        # @param payer_loaded_date [Date] Date that the payer loaded the credentialing span into their system.
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::Credentialing::V2::Types::ProviderCredentialingSpan]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.credentialing.v_2.create(
        #    rendering_provider_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32",
        #    contracting_provider_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32",
        #    payer_uuid: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32"
        #  )
        def create(rendering_provider_id:, contracting_provider_id:, payer_uuid:, regions:, start_date: nil,
                   end_date: nil, submitted_date: nil, payer_loaded_date: nil, request_options: nil)
          response = @request_client.conn.post do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.body = {
              **(request_options&.additional_body_parameters || {}),
              rendering_provider_id: rendering_provider_id,
              contracting_provider_id: contracting_provider_id,
              payer_uuid: payer_uuid,
              start_date: start_date,
              end_date: end_date,
              regions: regions,
              submitted_date: submitted_date,
              payer_loaded_date: payer_loaded_date
            }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/provider-credentialing-span/v2"
          end
          CandidApiClient::Credentialing::V2::Types::ProviderCredentialingSpan.from_json(json_object: response.body)
        end

        # @param provider_credentialing_id [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::Credentialing::V2::Types::ProviderCredentialingSpan]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.credentialing.v_2.get(provider_credentialing_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def get(provider_credentialing_id:, request_options: nil)
          response = @request_client.conn.get do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/provider-credentialing-span/v2/#{provider_credentialing_id}"
          end
          CandidApiClient::Credentialing::V2::Types::ProviderCredentialingSpan.from_json(json_object: response.body)
        end

        # @param limit [Integer] Maximum number of entities per page, defaults to 100.
        # @param page_token [String]
        # @param payer_uuid [String] Filter by payer.
        # @param provider_id [String] Filter to a particular provider. Use in conjunction as_rendering_provider and
        #  as_contracting_provider.
        # @param as_rendering_provider [Boolean] Filter to credentialing spans where the provider is a rendering provider. To use
        #  this filter provider_id is required.
        # @param as_contracting_provider [Boolean] Filter to credentialing spans where the provider is a contracting provider. To
        #  use this filter provider_id is required.
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::Credentialing::V2::Types::ProviderCredentialingSpanPage]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.credentialing.v_2.get_all
        def get_all(limit: nil, page_token: nil, payer_uuid: nil, provider_id: nil, as_rendering_provider: nil,
                    as_contracting_provider: nil, request_options: nil)
          response = @request_client.conn.get do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.params = {
              **(request_options&.additional_query_parameters || {}),
              "limit": limit,
              "page_token": page_token,
              "payer_uuid": payer_uuid,
              "provider_id": provider_id,
              "as_rendering_provider": as_rendering_provider,
              "as_contracting_provider": as_contracting_provider
            }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/provider-credentialing-span/v2"
          end
          CandidApiClient::Credentialing::V2::Types::ProviderCredentialingSpanPage.from_json(json_object: response.body)
        end

        # Soft deletes a credentialing span rate from the system.
        #
        # @param provider_credentialing_id [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [Void]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.credentialing.v_2.delete(provider_credentialing_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def delete(provider_credentialing_id:, request_options: nil)
          @request_client.conn.delete do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/provider-credentialing-span/v2/#{provider_credentialing_id}"
          end
        end

        # @param provider_credentialing_id [String]
        # @param contracting_provider_id [String] The ID of the practice location at which the rendering provider is covered by
        #  the credentialing span.
        # @param payer_uuid [String] The ID of the payer doing the credentialing.
        # @param start_date [Date] Start date of the credentialing span.
        # @param end_date [Date] End date of the credentialing span.
        # @param regions [CandidApiClient::Commons::Types::Regions] The states covered by the credentialing span. A span may be national and cover
        #  all states.
        # @param submitted_date [Date] Date that the credential paperwork was submitted.
        # @param payer_loaded_date [Date] Date that the payer loaded the credentialing span into their system.
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::Credentialing::V2::Types::ProviderCredentialingSpan]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.credentialing.v_2.update(provider_credentialing_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def update(provider_credentialing_id:, contracting_provider_id: nil, payer_uuid: nil, start_date: nil,
                   end_date: nil, regions: nil, submitted_date: nil, payer_loaded_date: nil, request_options: nil)
          response = @request_client.conn.patch do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.body = {
              **(request_options&.additional_body_parameters || {}),
              contracting_provider_id: contracting_provider_id,
              payer_uuid: payer_uuid,
              start_date: start_date,
              end_date: end_date,
              regions: regions,
              submitted_date: submitted_date,
              payer_loaded_date: payer_loaded_date
            }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/provider-credentialing-span/v2/#{provider_credentialing_id}"
          end
          CandidApiClient::Credentialing::V2::Types::ProviderCredentialingSpan.from_json(json_object: response.body)
        end
      end

      class AsyncV2Client
        # @return [CandidApiClient::AsyncRequestClient]
        attr_reader :request_client

        # @param request_client [CandidApiClient::AsyncRequestClient]
        # @return [CandidApiClient::Credentialing::V2::AsyncV2Client]
        def initialize(request_client:)
          @request_client = request_client
        end

        # @param rendering_provider_id [String] The ID of the rendering provider covered by the credentialing span.
        # @param contracting_provider_id [String] The ID of the practice location at which the rendering provider is covered by
        #  the credentialing span.
        # @param payer_uuid [String] The ID of the payer covered by the credentialing span.
        # @param start_date [Date] Start date of the credentialing span.
        # @param end_date [Date] End date of the credentialing span.
        # @param regions [CandidApiClient::Commons::Types::Regions] The states covered by the credentialing span. A span may be national and cover
        #  all states.
        # @param submitted_date [Date] Date that the credential paperwork was submitted.
        # @param payer_loaded_date [Date] Date that the payer loaded the credentialing span into their system.
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::Credentialing::V2::Types::ProviderCredentialingSpan]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.credentialing.v_2.create(
        #    rendering_provider_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32",
        #    contracting_provider_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32",
        #    payer_uuid: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32"
        #  )
        def create(rendering_provider_id:, contracting_provider_id:, payer_uuid:, regions:, start_date: nil,
                   end_date: nil, submitted_date: nil, payer_loaded_date: nil, request_options: nil)
          Async do
            response = @request_client.conn.post do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.body = {
                **(request_options&.additional_body_parameters || {}),
                rendering_provider_id: rendering_provider_id,
                contracting_provider_id: contracting_provider_id,
                payer_uuid: payer_uuid,
                start_date: start_date,
                end_date: end_date,
                regions: regions,
                submitted_date: submitted_date,
                payer_loaded_date: payer_loaded_date
              }.compact
              req.url "#{@request_client.get_url(environment: CandidApi,
                                                 request_options: request_options)}/api/provider-credentialing-span/v2"
            end
            CandidApiClient::Credentialing::V2::Types::ProviderCredentialingSpan.from_json(json_object: response.body)
          end
        end

        # @param provider_credentialing_id [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::Credentialing::V2::Types::ProviderCredentialingSpan]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.credentialing.v_2.get(provider_credentialing_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def get(provider_credentialing_id:, request_options: nil)
          Async do
            response = @request_client.conn.get do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.url "#{@request_client.get_url(environment: CandidApi,
                                                 request_options: request_options)}/api/provider-credentialing-span/v2/#{provider_credentialing_id}"
            end
            CandidApiClient::Credentialing::V2::Types::ProviderCredentialingSpan.from_json(json_object: response.body)
          end
        end

        # @param limit [Integer] Maximum number of entities per page, defaults to 100.
        # @param page_token [String]
        # @param payer_uuid [String] Filter by payer.
        # @param provider_id [String] Filter to a particular provider. Use in conjunction as_rendering_provider and
        #  as_contracting_provider.
        # @param as_rendering_provider [Boolean] Filter to credentialing spans where the provider is a rendering provider. To use
        #  this filter provider_id is required.
        # @param as_contracting_provider [Boolean] Filter to credentialing spans where the provider is a contracting provider. To
        #  use this filter provider_id is required.
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::Credentialing::V2::Types::ProviderCredentialingSpanPage]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.credentialing.v_2.get_all
        def get_all(limit: nil, page_token: nil, payer_uuid: nil, provider_id: nil, as_rendering_provider: nil,
                    as_contracting_provider: nil, request_options: nil)
          Async do
            response = @request_client.conn.get do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.params = {
                **(request_options&.additional_query_parameters || {}),
                "limit": limit,
                "page_token": page_token,
                "payer_uuid": payer_uuid,
                "provider_id": provider_id,
                "as_rendering_provider": as_rendering_provider,
                "as_contracting_provider": as_contracting_provider
              }.compact
              req.url "#{@request_client.get_url(environment: CandidApi,
                                                 request_options: request_options)}/api/provider-credentialing-span/v2"
            end
            CandidApiClient::Credentialing::V2::Types::ProviderCredentialingSpanPage.from_json(json_object: response.body)
          end
        end

        # Soft deletes a credentialing span rate from the system.
        #
        # @param provider_credentialing_id [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [Void]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.credentialing.v_2.delete(provider_credentialing_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def delete(provider_credentialing_id:, request_options: nil)
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
                                                 request_options: request_options)}/api/provider-credentialing-span/v2/#{provider_credentialing_id}"
            end
          end
        end

        # @param provider_credentialing_id [String]
        # @param contracting_provider_id [String] The ID of the practice location at which the rendering provider is covered by
        #  the credentialing span.
        # @param payer_uuid [String] The ID of the payer doing the credentialing.
        # @param start_date [Date] Start date of the credentialing span.
        # @param end_date [Date] End date of the credentialing span.
        # @param regions [CandidApiClient::Commons::Types::Regions] The states covered by the credentialing span. A span may be national and cover
        #  all states.
        # @param submitted_date [Date] Date that the credential paperwork was submitted.
        # @param payer_loaded_date [Date] Date that the payer loaded the credentialing span into their system.
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::Credentialing::V2::Types::ProviderCredentialingSpan]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.credentialing.v_2.update(provider_credentialing_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def update(provider_credentialing_id:, contracting_provider_id: nil, payer_uuid: nil, start_date: nil,
                   end_date: nil, regions: nil, submitted_date: nil, payer_loaded_date: nil, request_options: nil)
          Async do
            response = @request_client.conn.patch do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.body = {
                **(request_options&.additional_body_parameters || {}),
                contracting_provider_id: contracting_provider_id,
                payer_uuid: payer_uuid,
                start_date: start_date,
                end_date: end_date,
                regions: regions,
                submitted_date: submitted_date,
                payer_loaded_date: payer_loaded_date
              }.compact
              req.url "#{@request_client.get_url(environment: CandidApi,
                                                 request_options: request_options)}/api/provider-credentialing-span/v2/#{provider_credentialing_id}"
            end
            CandidApiClient::Credentialing::V2::Types::ProviderCredentialingSpan.from_json(json_object: response.body)
          end
        end
      end
    end
  end
end
