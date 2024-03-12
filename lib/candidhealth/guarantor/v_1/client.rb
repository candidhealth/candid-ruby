# frozen_string_literal: true

require_relative "../../../requests"
require_relative "../../commons/types/encounter_id"
require_relative "types/guarantor_create"
require_relative "types/guarantor"
require_relative "types/guarantor_id"
require "date"
require_relative "../../commons/types/street_address_short_zip"
require_relative "../../commons/types/phone_number"
require_relative "../../commons/types/email"
require "async"

module CandidApiClient
  module Guarantor
    module V1
      class V1Client
        attr_reader :request_client

        # @param request_client [RequestClient]
        # @return [Guarantor::V1::V1Client]
        def initialize(request_client:)
          # @type [RequestClient]
          @request_client = request_client
        end

        # Creates a new guarantor and returns the newly created Guarantor object.
        #
        # @param encounter_id [Commons::ENCOUNTER_ID]
        # @param request [Hash] Request of type Guarantor::V1::GuarantorCreate, as a Hash
        #   * :phone_numbers (Array<Commons::PhoneNumber>)
        #   * :phone_consent (Boolean)
        #   * :email (Commons::EMAIL)
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
        #     * :state (Commons::State)
        #     * :zip_code (String)
        # @param request_options [RequestOptions]
        # @return [Guarantor::V1::Guarantor]
        def create(encounter_id:, request:, request_options: nil)
          response = @request_client.conn.post("/api/guarantors/v1/#{encounter_id}") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
          end
          Guarantor::V1::Guarantor.from_json(json_object: response.body)
        end

        # Retrieves a guarantor by its `guarantor_id`.
        #
        # @param guarantor_id [Guarantor::V1::GUARANTOR_ID]
        # @param request_options [RequestOptions]
        # @return [Guarantor::V1::Guarantor]
        def get(guarantor_id:, request_options: nil)
          response = @request_client.conn.get("/api/guarantors/v1/#{guarantor_id}") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          end
          Guarantor::V1::Guarantor.from_json(json_object: response.body)
        end

        # Updates a guarantor by its `guarantor_id`.
        #
        # @param guarantor_id [Guarantor::V1::GUARANTOR_ID]
        # @param first_name [String]
        # @param last_name [String]
        # @param external_id [String] A unique identifier for the guarantor assigned by an external system.
        # @param date_of_birth [Date] Date formatted as YYYY-MM-DD; eg: 2019-08-25.
        # @param address [Hash] Request of type Commons::StreetAddressShortZip, as a Hash
        #   * :zip_plus_four_code (String)
        #   * :address_1 (String)
        #   * :address_2 (String)
        #   * :city (String)
        #   * :state (Commons::State)
        #   * :zip_code (String)
        # @param phone_numbers [Array<Hash>] Request of type Array<Commons::PhoneNumber>, as a Hash
        #   * :number (String)
        #   * :type (Commons::PhoneNumberType)
        # @param phone_consent [Boolean]
        # @param email [Commons::EMAIL]
        # @param email_consent [Boolean]
        # @param request_options [RequestOptions]
        # @return [Guarantor::V1::Guarantor]
        def update(guarantor_id:, first_name: nil, last_name: nil, external_id: nil, date_of_birth: nil, address: nil,
                   phone_numbers: nil, phone_consent: nil, email: nil, email_consent: nil, request_options: nil)
          response = @request_client.conn.patch("/api/guarantors/v1/#{guarantor_id}") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.body = {
              **(request_options&.additional_body_parameters || {}),
              first_name: first_name,
              last_name: last_name,
              external_id: external_id,
              date_of_birth: date_of_birth,
              address: address,
              phone_numbers: phone_numbers,
              phone_consent: phone_consent,
              email: email,
              email_consent: email_consent
            }.compact
          end
          Guarantor::V1::Guarantor.from_json(json_object: response.body)
        end
      end

      class AsyncV1Client
        attr_reader :request_client

        # @param request_client [AsyncRequestClient]
        # @return [Guarantor::V1::AsyncV1Client]
        def initialize(request_client:)
          # @type [AsyncRequestClient]
          @request_client = request_client
        end

        # Creates a new guarantor and returns the newly created Guarantor object.
        #
        # @param encounter_id [Commons::ENCOUNTER_ID]
        # @param request [Hash] Request of type Guarantor::V1::GuarantorCreate, as a Hash
        #   * :phone_numbers (Array<Commons::PhoneNumber>)
        #   * :phone_consent (Boolean)
        #   * :email (Commons::EMAIL)
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
        #     * :state (Commons::State)
        #     * :zip_code (String)
        # @param request_options [RequestOptions]
        # @return [Guarantor::V1::Guarantor]
        def create(encounter_id:, request:, request_options: nil)
          Async do
            response = @request_client.conn.post("/api/guarantors/v1/#{encounter_id}") do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
              req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
            end
            Guarantor::V1::Guarantor.from_json(json_object: response.body)
          end
        end

        # Retrieves a guarantor by its `guarantor_id`.
        #
        # @param guarantor_id [Guarantor::V1::GUARANTOR_ID]
        # @param request_options [RequestOptions]
        # @return [Guarantor::V1::Guarantor]
        def get(guarantor_id:, request_options: nil)
          Async do
            response = @request_client.conn.get("/api/guarantors/v1/#{guarantor_id}") do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            end
            Guarantor::V1::Guarantor.from_json(json_object: response.body)
          end
        end

        # Updates a guarantor by its `guarantor_id`.
        #
        # @param guarantor_id [Guarantor::V1::GUARANTOR_ID]
        # @param first_name [String]
        # @param last_name [String]
        # @param external_id [String] A unique identifier for the guarantor assigned by an external system.
        # @param date_of_birth [Date] Date formatted as YYYY-MM-DD; eg: 2019-08-25.
        # @param address [Hash] Request of type Commons::StreetAddressShortZip, as a Hash
        #   * :zip_plus_four_code (String)
        #   * :address_1 (String)
        #   * :address_2 (String)
        #   * :city (String)
        #   * :state (Commons::State)
        #   * :zip_code (String)
        # @param phone_numbers [Array<Hash>] Request of type Array<Commons::PhoneNumber>, as a Hash
        #   * :number (String)
        #   * :type (Commons::PhoneNumberType)
        # @param phone_consent [Boolean]
        # @param email [Commons::EMAIL]
        # @param email_consent [Boolean]
        # @param request_options [RequestOptions]
        # @return [Guarantor::V1::Guarantor]
        def update(guarantor_id:, first_name: nil, last_name: nil, external_id: nil, date_of_birth: nil, address: nil,
                   phone_numbers: nil, phone_consent: nil, email: nil, email_consent: nil, request_options: nil)
          Async do
            response = @request_client.conn.patch("/api/guarantors/v1/#{guarantor_id}") do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
              req.body = {
                **(request_options&.additional_body_parameters || {}),
                first_name: first_name,
                last_name: last_name,
                external_id: external_id,
                date_of_birth: date_of_birth,
                address: address,
                phone_numbers: phone_numbers,
                phone_consent: phone_consent,
                email: email,
                email_consent: email_consent
              }.compact
            end
            Guarantor::V1::Guarantor.from_json(json_object: response.body)
          end
        end
      end
    end
  end
end
