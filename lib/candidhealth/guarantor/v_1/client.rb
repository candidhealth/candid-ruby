# frozen_string_literal: true

require_relative "../../../requests"
require_relative "types/guarantor_create"
require_relative "types/guarantor"
require_relative "types/guarantor_update"
require "async"

module CandidApiClient
  module Guarantor
    module V1
      class V1Client
        # @return [CandidApiClient::RequestClient]
        attr_reader :request_client

        # @param request_client [CandidApiClient::RequestClient]
        # @return [CandidApiClient::Guarantor::V1::V1Client]
        def initialize(request_client:)
          @request_client = request_client
        end

        # Creates a new guarantor and returns the newly created Guarantor object.
        #
        # @param encounter_id [String]
        # @param request [Hash] Request of type CandidApiClient::Guarantor::V1::Types::GuarantorCreate, as a Hash
        #   * :phone_numbers (Array<CandidApiClient::Commons::Types::PhoneNumber>)
        #   * :phone_consent (Boolean)
        #   * :email (String)
        #   * :email_consent (Boolean)
        #   * :first_name (String)
        #   * :last_name (String)
        #   * :external_id (String)
        #   * :date_of_birth (Date)
        #   * :address (Hash)
        #     * :zip_plus_four_code (String)
        #     * :address_1 (String)
        #     * :address_2 (String)
        #     * :city (String)
        #     * :state (CandidApiClient::Commons::Types::State)
        #     * :zip_code (String)
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::Guarantor::V1::Types::Guarantor]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.guarantor.v_1.create(encounter_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", request: { phone_numbers: [{ number: "1234567890", type: HOME }], phone_consent: true, email: "johndoe@joincandidhealth.com", email_consent: true, first_name: "string", last_name: "string", external_id: "string", date_of_birth: DateTime.parse(2023-01-15), address: { address_1: "123 Main St", address_2: "Apt 1", city: "New York", state: NY, zip_code: "10001", zip_plus_four_code: "1234" } })
        def create(encounter_id:, request:, request_options: nil)
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
                                               request_options: request_options)}/api/guarantors/v1/#{encounter_id}"
          end
          CandidApiClient::Guarantor::V1::Types::Guarantor.from_json(json_object: response.body)
        end

        # Retrieves a guarantor by its `guarantor_id`.
        #
        # @param guarantor_id [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::Guarantor::V1::Types::Guarantor]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.guarantor.v_1.get(guarantor_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def get(guarantor_id:, request_options: nil)
          response = @request_client.conn.get do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/guarantors/v1/#{guarantor_id}"
          end
          CandidApiClient::Guarantor::V1::Types::Guarantor.from_json(json_object: response.body)
        end

        # Updates a guarantor by its `guarantor_id`.
        #
        # @param guarantor_id [String]
        # @param request [Hash] Request of type CandidApiClient::Guarantor::V1::Types::GuarantorUpdate, as a Hash
        #   * :first_name (String)
        #   * :last_name (String)
        #   * :external_id (String)
        #   * :date_of_birth (Date)
        #   * :address (Hash)
        #     * :zip_plus_four_code (String)
        #     * :address_1 (String)
        #     * :address_2 (String)
        #     * :city (String)
        #     * :state (CandidApiClient::Commons::Types::State)
        #     * :zip_code (String)
        #   * :phone_numbers (Array<CandidApiClient::Commons::Types::PhoneNumber>)
        #   * :phone_consent (Boolean)
        #   * :email (String)
        #   * :email_consent (Boolean)
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::Guarantor::V1::Types::Guarantor]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.guarantor.v_1.update(guarantor_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", request: {  })
        def update(guarantor_id:, request:, request_options: nil)
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
                                               request_options: request_options)}/api/guarantors/v1/#{guarantor_id}"
          end
          CandidApiClient::Guarantor::V1::Types::Guarantor.from_json(json_object: response.body)
        end
      end

      class AsyncV1Client
        # @return [CandidApiClient::AsyncRequestClient]
        attr_reader :request_client

        # @param request_client [CandidApiClient::AsyncRequestClient]
        # @return [CandidApiClient::Guarantor::V1::AsyncV1Client]
        def initialize(request_client:)
          @request_client = request_client
        end

        # Creates a new guarantor and returns the newly created Guarantor object.
        #
        # @param encounter_id [String]
        # @param request [Hash] Request of type CandidApiClient::Guarantor::V1::Types::GuarantorCreate, as a Hash
        #   * :phone_numbers (Array<CandidApiClient::Commons::Types::PhoneNumber>)
        #   * :phone_consent (Boolean)
        #   * :email (String)
        #   * :email_consent (Boolean)
        #   * :first_name (String)
        #   * :last_name (String)
        #   * :external_id (String)
        #   * :date_of_birth (Date)
        #   * :address (Hash)
        #     * :zip_plus_four_code (String)
        #     * :address_1 (String)
        #     * :address_2 (String)
        #     * :city (String)
        #     * :state (CandidApiClient::Commons::Types::State)
        #     * :zip_code (String)
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::Guarantor::V1::Types::Guarantor]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.guarantor.v_1.create(encounter_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", request: { phone_numbers: [{ number: "1234567890", type: HOME }], phone_consent: true, email: "johndoe@joincandidhealth.com", email_consent: true, first_name: "string", last_name: "string", external_id: "string", date_of_birth: DateTime.parse(2023-01-15), address: { address_1: "123 Main St", address_2: "Apt 1", city: "New York", state: NY, zip_code: "10001", zip_plus_four_code: "1234" } })
        def create(encounter_id:, request:, request_options: nil)
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
                                                 request_options: request_options)}/api/guarantors/v1/#{encounter_id}"
            end
            CandidApiClient::Guarantor::V1::Types::Guarantor.from_json(json_object: response.body)
          end
        end

        # Retrieves a guarantor by its `guarantor_id`.
        #
        # @param guarantor_id [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::Guarantor::V1::Types::Guarantor]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.guarantor.v_1.get(guarantor_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def get(guarantor_id:, request_options: nil)
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
                                                 request_options: request_options)}/api/guarantors/v1/#{guarantor_id}"
            end
            CandidApiClient::Guarantor::V1::Types::Guarantor.from_json(json_object: response.body)
          end
        end

        # Updates a guarantor by its `guarantor_id`.
        #
        # @param guarantor_id [String]
        # @param request [Hash] Request of type CandidApiClient::Guarantor::V1::Types::GuarantorUpdate, as a Hash
        #   * :first_name (String)
        #   * :last_name (String)
        #   * :external_id (String)
        #   * :date_of_birth (Date)
        #   * :address (Hash)
        #     * :zip_plus_four_code (String)
        #     * :address_1 (String)
        #     * :address_2 (String)
        #     * :city (String)
        #     * :state (CandidApiClient::Commons::Types::State)
        #     * :zip_code (String)
        #   * :phone_numbers (Array<CandidApiClient::Commons::Types::PhoneNumber>)
        #   * :phone_consent (Boolean)
        #   * :email (String)
        #   * :email_consent (Boolean)
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::Guarantor::V1::Types::Guarantor]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.guarantor.v_1.update(guarantor_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", request: {  })
        def update(guarantor_id:, request:, request_options: nil)
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
                                                 request_options: request_options)}/api/guarantors/v1/#{guarantor_id}"
            end
            CandidApiClient::Guarantor::V1::Types::Guarantor.from_json(json_object: response.body)
          end
        end
      end
    end
  end
end
