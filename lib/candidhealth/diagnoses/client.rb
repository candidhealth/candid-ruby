# frozen_string_literal: true

require_relative "../../requests"
require_relative "types/standalone_diagnosis_create"
require_relative "types/diagnosis"
require_relative "types/diagnosis_type_code"
require_relative "../yes_no_indicator/types/yes_no_indicator"
require "async"

module CandidApiClient
  class DiagnosesClient
    # @return [CandidApiClient::RequestClient]
    attr_reader :request_client

    # @param request_client [CandidApiClient::RequestClient]
    # @return [CandidApiClient::DiagnosesClient]
    def initialize(request_client:)
      @request_client = request_client
    end

    # Creates a new diagnosis for an encounter
    #
    # @param request [Hash] Request of type CandidApiClient::Diagnoses::Types::StandaloneDiagnosisCreate, as a Hash
    #   * :encounter_id (String)
    #   * :name (String)
    #   * :code_type (CandidApiClient::Diagnoses::Types::DiagnosisTypeCode)
    #   * :code (String)
    #   * :present_on_admission_indicator (CandidApiClient::YesNoIndicator::Types::YesNoIndicator)
    # @param request_options [CandidApiClient::RequestOptions]
    # @return [CandidApiClient::Diagnoses::Types::Diagnosis]
    # @example
    #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
    #  api.diagnoses.create(request: { encounter_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", code_type: ABF, code: "code" })
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
        req.url "#{@request_client.get_url(environment: CandidApi, request_options: request_options)}/api/diagnoses/v2"
      end
      CandidApiClient::Diagnoses::Types::Diagnosis.from_json(json_object: response.body)
    end

    # Updates the diagnosis record matching the provided `diagnosis_id`
    #
    # @param diagnosis_id [String]
    # @param name [String] Empty string not allowed.
    # @param code_type [CandidApiClient::Diagnoses::Types::DiagnosisTypeCode] Typically, providers submitting claims to Candid are using ICD-10 diagnosis
    #  codes. If you are using ICD-10 codes, the primary diagnosis code listed on the
    #  claim should use the ABK code_type. If more than one diagnosis is being
    #  submitted on a claim, please use ABF for the rest of the listed diagnoses. If
    #  you are using ICD-9 diagnosis codes, use BK and BF for the principal and
    #  following diagnosis code(s) respectively.
    # @param code [String] Empty string not allowed.
    #  Should be of the appropriate format for the provided `code_type`.
    #  Must obey the ICD-10 format if an ICD-10 code_type is provided, specifically:
    #  - Letter
    #  - Digit
    #  - Digit or the letter `A` or `B`
    #  - (Optional) Period `.`
    #  - Up to 4 (or as few as 0) letters and digits
    # @param present_on_admission_indicator [CandidApiClient::YesNoIndicator::Types::YesNoIndicator] For Institutional claims only.
    #  A "Y" indicates that the onset occurred prior to admission to the hospital.
    #  An "N" indicates that the onset did NOT occur prior to admission to the
    #  hospital.
    #  A "U" indicates that it is unknown whether the onset occurred prior to admission
    #  to the hospital or not.
    # @param request_options [CandidApiClient::RequestOptions]
    # @return [CandidApiClient::Diagnoses::Types::Diagnosis]
    # @example
    #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
    #  api.diagnoses.update(diagnosis_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
    def update(diagnosis_id:, name: nil, code_type: nil, code: nil, present_on_admission_indicator: nil,
               request_options: nil)
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
          name: name,
          code_type: code_type,
          code: code,
          present_on_admission_indicator: present_on_admission_indicator
        }.compact
        req.url "#{@request_client.get_url(environment: CandidApi,
                                           request_options: request_options)}/api/diagnoses/v2/#{diagnosis_id}"
      end
      CandidApiClient::Diagnoses::Types::Diagnosis.from_json(json_object: response.body)
    end

    # Deletes the diagnosis record associated with the provided `diagnosis_id`
    #
    # @param diagnosis_id [String]
    # @param request_options [CandidApiClient::RequestOptions]
    # @return [Void]
    # @example
    #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
    #  api.diagnoses.delete(diagnosis_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
    def delete(diagnosis_id:, request_options: nil)
      @request_client.conn.delete do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        req.url "#{@request_client.get_url(environment: CandidApi,
                                           request_options: request_options)}/api/diagnoses/v2/#{diagnosis_id}"
      end
    end
  end

  class AsyncDiagnosesClient
    # @return [CandidApiClient::AsyncRequestClient]
    attr_reader :request_client

    # @param request_client [CandidApiClient::AsyncRequestClient]
    # @return [CandidApiClient::AsyncDiagnosesClient]
    def initialize(request_client:)
      @request_client = request_client
    end

    # Creates a new diagnosis for an encounter
    #
    # @param request [Hash] Request of type CandidApiClient::Diagnoses::Types::StandaloneDiagnosisCreate, as a Hash
    #   * :encounter_id (String)
    #   * :name (String)
    #   * :code_type (CandidApiClient::Diagnoses::Types::DiagnosisTypeCode)
    #   * :code (String)
    #   * :present_on_admission_indicator (CandidApiClient::YesNoIndicator::Types::YesNoIndicator)
    # @param request_options [CandidApiClient::RequestOptions]
    # @return [CandidApiClient::Diagnoses::Types::Diagnosis]
    # @example
    #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
    #  api.diagnoses.create(request: { encounter_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", code_type: ABF, code: "code" })
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
          req.url "#{@request_client.get_url(environment: CandidApi,
                                             request_options: request_options)}/api/diagnoses/v2"
        end
        CandidApiClient::Diagnoses::Types::Diagnosis.from_json(json_object: response.body)
      end
    end

    # Updates the diagnosis record matching the provided `diagnosis_id`
    #
    # @param diagnosis_id [String]
    # @param name [String] Empty string not allowed.
    # @param code_type [CandidApiClient::Diagnoses::Types::DiagnosisTypeCode] Typically, providers submitting claims to Candid are using ICD-10 diagnosis
    #  codes. If you are using ICD-10 codes, the primary diagnosis code listed on the
    #  claim should use the ABK code_type. If more than one diagnosis is being
    #  submitted on a claim, please use ABF for the rest of the listed diagnoses. If
    #  you are using ICD-9 diagnosis codes, use BK and BF for the principal and
    #  following diagnosis code(s) respectively.
    # @param code [String] Empty string not allowed.
    #  Should be of the appropriate format for the provided `code_type`.
    #  Must obey the ICD-10 format if an ICD-10 code_type is provided, specifically:
    #  - Letter
    #  - Digit
    #  - Digit or the letter `A` or `B`
    #  - (Optional) Period `.`
    #  - Up to 4 (or as few as 0) letters and digits
    # @param present_on_admission_indicator [CandidApiClient::YesNoIndicator::Types::YesNoIndicator] For Institutional claims only.
    #  A "Y" indicates that the onset occurred prior to admission to the hospital.
    #  An "N" indicates that the onset did NOT occur prior to admission to the
    #  hospital.
    #  A "U" indicates that it is unknown whether the onset occurred prior to admission
    #  to the hospital or not.
    # @param request_options [CandidApiClient::RequestOptions]
    # @return [CandidApiClient::Diagnoses::Types::Diagnosis]
    # @example
    #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
    #  api.diagnoses.update(diagnosis_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
    def update(diagnosis_id:, name: nil, code_type: nil, code: nil, present_on_admission_indicator: nil,
               request_options: nil)
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
            name: name,
            code_type: code_type,
            code: code,
            present_on_admission_indicator: present_on_admission_indicator
          }.compact
          req.url "#{@request_client.get_url(environment: CandidApi,
                                             request_options: request_options)}/api/diagnoses/v2/#{diagnosis_id}"
        end
        CandidApiClient::Diagnoses::Types::Diagnosis.from_json(json_object: response.body)
      end
    end

    # Deletes the diagnosis record associated with the provided `diagnosis_id`
    #
    # @param diagnosis_id [String]
    # @param request_options [CandidApiClient::RequestOptions]
    # @return [Void]
    # @example
    #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
    #  api.diagnoses.delete(diagnosis_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
    def delete(diagnosis_id:, request_options: nil)
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
                                             request_options: request_options)}/api/diagnoses/v2/#{diagnosis_id}"
        end
      end
    end
  end
end
