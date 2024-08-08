# frozen_string_literal: true

require_relative "../../../../requests"
require_relative "types/mutable_coverage"
require_relative "types/coverage"
require "json"
require "date"
require "async"

module CandidApiClient
  module PreEncounter
    module Coverages
      module V1
        class V1Client
          # @return [CandidApiClient::RequestClient]
          attr_reader :request_client

          # @param request_client [CandidApiClient::RequestClient]
          # @return [CandidApiClient::PreEncounter::Coverages::V1::V1Client]
          def initialize(request_client:)
            @request_client = request_client
          end

          # Creates a new Coverage. A Coverage provides the high-level identifiers and
          #  descriptors of a specific insurance plan for a specific individual - typically
          #  the information you can find on an insurance card. Additionally a coverage will
          #  include detailed benefits information covered by the specific plan for the
          #  individual.
          #
          # @param request [Hash] Request of type CandidApiClient::PreEncounter::Coverages::V1::Types::MutableCoverage, as a Hash
          #   * :status (CandidApiClient::PreEncounter::Coverages::V1::Types::CoverageStatus)
          #   * :subscriber (Hash)
          #     * :name (Hash)
          #       * :family (String)
          #       * :given (Array<String>)
          #       * :use (CandidApiClient::PreEncounter::Common::Types::NameUse)
          #       * :period (Hash)
          #         * :start (Date)
          #         * :end_ (Date)
          #     * :date_of_birth (Date)
          #     * :gender (CandidApiClient::PreEncounter::Common::Types::Gender)
          #   * :relationship (CandidApiClient::PreEncounter::Common::Types::Relationship)
          #   * :patient (String)
          #   * :insurance_plan (Hash)
          #     * :member_id (String)
          #     * :payer_id (String)
          #     * :payer_name (String)
          #     * :group_number (String)
          #     * :name (String)
          #     * :type (CandidApiClient::PreEncounter::Coverages::V1::Types::NetworkType)
          #     * :period (Hash)
          #       * :start (Date)
          #       * :end_ (Date)
          #     * :insurance_card_image_locator (String)
          #   * :verified (Boolean)
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::Coverage]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com")
          #  api.pre_encounter.coverages.v_1.create(request: { status: ACTIVE, subscriber: { name: {  }, date_of_birth: DateTime.parse(2023-01-15), gender: MAN }, relationship: SELF, patient: "string", insurance_plan: { member_id: "string", payer_id: "string", payer_name: "string", group_number: "string", name: "string", type: PPO, period: {  }, insurance_card_image_locator: "string" }, verified: true })
          def create(request:, request_options: nil)
            response = @request_client.conn.post do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
              req.url "#{@request_client.get_url(environment: PreEncounter,
                                                 request_options: request_options)}/coverages/v1"
            end
            CandidApiClient::PreEncounter::Coverages::V1::Types::Coverage.from_json(json_object: response.body)
          end

          # Updates a Coverage. The path must contain the most recent version to prevent
          #  races. Updating historic versions is not supported.
          #
          # @param id [String]
          # @param version [String]
          # @param request [Hash] Request of type CandidApiClient::PreEncounter::Coverages::V1::Types::MutableCoverage, as a Hash
          #   * :status (CandidApiClient::PreEncounter::Coverages::V1::Types::CoverageStatus)
          #   * :subscriber (Hash)
          #     * :name (Hash)
          #       * :family (String)
          #       * :given (Array<String>)
          #       * :use (CandidApiClient::PreEncounter::Common::Types::NameUse)
          #       * :period (Hash)
          #         * :start (Date)
          #         * :end_ (Date)
          #     * :date_of_birth (Date)
          #     * :gender (CandidApiClient::PreEncounter::Common::Types::Gender)
          #   * :relationship (CandidApiClient::PreEncounter::Common::Types::Relationship)
          #   * :patient (String)
          #   * :insurance_plan (Hash)
          #     * :member_id (String)
          #     * :payer_id (String)
          #     * :payer_name (String)
          #     * :group_number (String)
          #     * :name (String)
          #     * :type (CandidApiClient::PreEncounter::Coverages::V1::Types::NetworkType)
          #     * :period (Hash)
          #       * :start (Date)
          #       * :end_ (Date)
          #     * :insurance_card_image_locator (String)
          #   * :verified (Boolean)
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::Coverage]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com")
          #  api.pre_encounter.coverages.v_1.update(
          #    id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32",
          #    version: "string",
          #    request: { status: ACTIVE, subscriber: { name: {  }, date_of_birth: DateTime.parse(2023-01-15), gender: MAN }, relationship: SELF, patient: "string", insurance_plan: { member_id: "string", payer_id: "string", payer_name: "string", group_number: "string", name: "string", type: PPO, period: {  }, insurance_card_image_locator: "string" }, verified: true }
          #  )
          def update(id:, version:, request:, request_options: nil)
            response = @request_client.conn.put do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
              req.url "#{@request_client.get_url(environment: PreEncounter,
                                                 request_options: request_options)}/coverages/v1/#{id}/#{version}"
            end
            CandidApiClient::PreEncounter::Coverages::V1::Types::Coverage.from_json(json_object: response.body)
          end

          # gets a specific Coverage
          #
          # @param id [String]
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::Coverage]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com")
          #  api.pre_encounter.coverages.v_1.get(id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
          def get(id:, request_options: nil)
            response = @request_client.conn.get do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.url "#{@request_client.get_url(environment: PreEncounter,
                                                 request_options: request_options)}/coverages/v1/#{id}"
            end
            CandidApiClient::PreEncounter::Coverages::V1::Types::Coverage.from_json(json_object: response.body)
          end

          # Gets a coverage along with it's full history. The return list is ordered by
          #  version ascending.
          #
          # @param id [String]
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [Array<CandidApiClient::PreEncounter::Coverages::V1::Types::Coverage>]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com")
          #  api.pre_encounter.coverages.v_1.get_history(id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
          def get_history(id:, request_options: nil)
            response = @request_client.conn.get do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.url "#{@request_client.get_url(environment: PreEncounter,
                                                 request_options: request_options)}/coverages/v1/#{id}/history"
            end
            parsed_json = JSON.parse(response.body)
            parsed_json&.map do |item|
              item = item.to_json
              CandidApiClient::PreEncounter::Coverages::V1::Types::Coverage.from_json(json_object: item)
            end
          end

          # returns a list of Coverages based on the search criteria
          #
          # @param patient_id [String]
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [Array<CandidApiClient::PreEncounter::Coverages::V1::Types::Coverage>]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com")
          #  api.pre_encounter.coverages.v_1.get_multi(patient_id: "string")
          def get_multi(patient_id: nil, request_options: nil)
            response = @request_client.conn.get do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.params = { **(request_options&.additional_query_parameters || {}), "patient_id": patient_id }.compact
              req.url "#{@request_client.get_url(environment: PreEncounter,
                                                 request_options: request_options)}/coverages/v1"
            end
            parsed_json = JSON.parse(response.body)
            parsed_json&.map do |item|
              item = item.to_json
              CandidApiClient::PreEncounter::Coverages::V1::Types::Coverage.from_json(json_object: item)
            end
          end

          # Scans up to 100 coverage updates. The since query parameter is inclusive, and
          #  the result list is ordered by updatedAt descending.
          #
          # @param since [DateTime]
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [Array<CandidApiClient::PreEncounter::Coverages::V1::Types::Coverage>]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com")
          #  api.pre_encounter.coverages.v_1.scan(since: DateTime.parse(2024-01-15T09:30:00.000Z))
          def scan(since:, request_options: nil)
            response = @request_client.conn.get do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.params = { **(request_options&.additional_query_parameters || {}), "since": since }.compact
              req.url "#{@request_client.get_url(environment: PreEncounter,
                                                 request_options: request_options)}/coverages/v1/updates/scan"
            end
            parsed_json = JSON.parse(response.body)
            parsed_json&.map do |item|
              item = item.to_json
              CandidApiClient::PreEncounter::Coverages::V1::Types::Coverage.from_json(json_object: item)
            end
          end
        end

        class AsyncV1Client
          # @return [CandidApiClient::AsyncRequestClient]
          attr_reader :request_client

          # @param request_client [CandidApiClient::AsyncRequestClient]
          # @return [CandidApiClient::PreEncounter::Coverages::V1::AsyncV1Client]
          def initialize(request_client:)
            @request_client = request_client
          end

          # Creates a new Coverage. A Coverage provides the high-level identifiers and
          #  descriptors of a specific insurance plan for a specific individual - typically
          #  the information you can find on an insurance card. Additionally a coverage will
          #  include detailed benefits information covered by the specific plan for the
          #  individual.
          #
          # @param request [Hash] Request of type CandidApiClient::PreEncounter::Coverages::V1::Types::MutableCoverage, as a Hash
          #   * :status (CandidApiClient::PreEncounter::Coverages::V1::Types::CoverageStatus)
          #   * :subscriber (Hash)
          #     * :name (Hash)
          #       * :family (String)
          #       * :given (Array<String>)
          #       * :use (CandidApiClient::PreEncounter::Common::Types::NameUse)
          #       * :period (Hash)
          #         * :start (Date)
          #         * :end_ (Date)
          #     * :date_of_birth (Date)
          #     * :gender (CandidApiClient::PreEncounter::Common::Types::Gender)
          #   * :relationship (CandidApiClient::PreEncounter::Common::Types::Relationship)
          #   * :patient (String)
          #   * :insurance_plan (Hash)
          #     * :member_id (String)
          #     * :payer_id (String)
          #     * :payer_name (String)
          #     * :group_number (String)
          #     * :name (String)
          #     * :type (CandidApiClient::PreEncounter::Coverages::V1::Types::NetworkType)
          #     * :period (Hash)
          #       * :start (Date)
          #       * :end_ (Date)
          #     * :insurance_card_image_locator (String)
          #   * :verified (Boolean)
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::Coverage]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com")
          #  api.pre_encounter.coverages.v_1.create(request: { status: ACTIVE, subscriber: { name: {  }, date_of_birth: DateTime.parse(2023-01-15), gender: MAN }, relationship: SELF, patient: "string", insurance_plan: { member_id: "string", payer_id: "string", payer_name: "string", group_number: "string", name: "string", type: PPO, period: {  }, insurance_card_image_locator: "string" }, verified: true })
          def create(request:, request_options: nil)
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
                req.url "#{@request_client.get_url(environment: PreEncounter,
                                                   request_options: request_options)}/coverages/v1"
              end
              CandidApiClient::PreEncounter::Coverages::V1::Types::Coverage.from_json(json_object: response.body)
            end
          end

          # Updates a Coverage. The path must contain the most recent version to prevent
          #  races. Updating historic versions is not supported.
          #
          # @param id [String]
          # @param version [String]
          # @param request [Hash] Request of type CandidApiClient::PreEncounter::Coverages::V1::Types::MutableCoverage, as a Hash
          #   * :status (CandidApiClient::PreEncounter::Coverages::V1::Types::CoverageStatus)
          #   * :subscriber (Hash)
          #     * :name (Hash)
          #       * :family (String)
          #       * :given (Array<String>)
          #       * :use (CandidApiClient::PreEncounter::Common::Types::NameUse)
          #       * :period (Hash)
          #         * :start (Date)
          #         * :end_ (Date)
          #     * :date_of_birth (Date)
          #     * :gender (CandidApiClient::PreEncounter::Common::Types::Gender)
          #   * :relationship (CandidApiClient::PreEncounter::Common::Types::Relationship)
          #   * :patient (String)
          #   * :insurance_plan (Hash)
          #     * :member_id (String)
          #     * :payer_id (String)
          #     * :payer_name (String)
          #     * :group_number (String)
          #     * :name (String)
          #     * :type (CandidApiClient::PreEncounter::Coverages::V1::Types::NetworkType)
          #     * :period (Hash)
          #       * :start (Date)
          #       * :end_ (Date)
          #     * :insurance_card_image_locator (String)
          #   * :verified (Boolean)
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::Coverage]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com")
          #  api.pre_encounter.coverages.v_1.update(
          #    id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32",
          #    version: "string",
          #    request: { status: ACTIVE, subscriber: { name: {  }, date_of_birth: DateTime.parse(2023-01-15), gender: MAN }, relationship: SELF, patient: "string", insurance_plan: { member_id: "string", payer_id: "string", payer_name: "string", group_number: "string", name: "string", type: PPO, period: {  }, insurance_card_image_locator: "string" }, verified: true }
          #  )
          def update(id:, version:, request:, request_options: nil)
            Async do
              response = @request_client.conn.put do |req|
                req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
                req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
                req.headers = {
              **(req.headers || {}),
              **@request_client.get_headers,
              **(request_options&.additional_headers || {})
                }.compact
                req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
                req.url "#{@request_client.get_url(environment: PreEncounter,
                                                   request_options: request_options)}/coverages/v1/#{id}/#{version}"
              end
              CandidApiClient::PreEncounter::Coverages::V1::Types::Coverage.from_json(json_object: response.body)
            end
          end

          # gets a specific Coverage
          #
          # @param id [String]
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::Coverage]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com")
          #  api.pre_encounter.coverages.v_1.get(id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
          def get(id:, request_options: nil)
            Async do
              response = @request_client.conn.get do |req|
                req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
                req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
                req.headers = {
              **(req.headers || {}),
              **@request_client.get_headers,
              **(request_options&.additional_headers || {})
                }.compact
                req.url "#{@request_client.get_url(environment: PreEncounter,
                                                   request_options: request_options)}/coverages/v1/#{id}"
              end
              CandidApiClient::PreEncounter::Coverages::V1::Types::Coverage.from_json(json_object: response.body)
            end
          end

          # Gets a coverage along with it's full history. The return list is ordered by
          #  version ascending.
          #
          # @param id [String]
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [Array<CandidApiClient::PreEncounter::Coverages::V1::Types::Coverage>]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com")
          #  api.pre_encounter.coverages.v_1.get_history(id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
          def get_history(id:, request_options: nil)
            Async do
              response = @request_client.conn.get do |req|
                req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
                req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
                req.headers = {
              **(req.headers || {}),
              **@request_client.get_headers,
              **(request_options&.additional_headers || {})
                }.compact
                req.url "#{@request_client.get_url(environment: PreEncounter,
                                                   request_options: request_options)}/coverages/v1/#{id}/history"
              end
              parsed_json = JSON.parse(response.body)
              parsed_json&.map do |item|
                item = item.to_json
                CandidApiClient::PreEncounter::Coverages::V1::Types::Coverage.from_json(json_object: item)
              end
            end
          end

          # returns a list of Coverages based on the search criteria
          #
          # @param patient_id [String]
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [Array<CandidApiClient::PreEncounter::Coverages::V1::Types::Coverage>]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com")
          #  api.pre_encounter.coverages.v_1.get_multi(patient_id: "string")
          def get_multi(patient_id: nil, request_options: nil)
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
                  "patient_id": patient_id
                }.compact
                req.url "#{@request_client.get_url(environment: PreEncounter,
                                                   request_options: request_options)}/coverages/v1"
              end
              parsed_json = JSON.parse(response.body)
              parsed_json&.map do |item|
                item = item.to_json
                CandidApiClient::PreEncounter::Coverages::V1::Types::Coverage.from_json(json_object: item)
              end
            end
          end

          # Scans up to 100 coverage updates. The since query parameter is inclusive, and
          #  the result list is ordered by updatedAt descending.
          #
          # @param since [DateTime]
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [Array<CandidApiClient::PreEncounter::Coverages::V1::Types::Coverage>]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com")
          #  api.pre_encounter.coverages.v_1.scan(since: DateTime.parse(2024-01-15T09:30:00.000Z))
          def scan(since:, request_options: nil)
            Async do
              response = @request_client.conn.get do |req|
                req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
                req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
                req.headers = {
              **(req.headers || {}),
              **@request_client.get_headers,
              **(request_options&.additional_headers || {})
                }.compact
                req.params = { **(request_options&.additional_query_parameters || {}), "since": since }.compact
                req.url "#{@request_client.get_url(environment: PreEncounter,
                                                   request_options: request_options)}/coverages/v1/updates/scan"
              end
              parsed_json = JSON.parse(response.body)
              parsed_json&.map do |item|
                item = item.to_json
                CandidApiClient::PreEncounter::Coverages::V1::Types::Coverage.from_json(json_object: item)
              end
            end
          end
        end
      end
    end
  end
end
