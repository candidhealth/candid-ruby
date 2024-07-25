# frozen_string_literal: true

require_relative "../../../../requests"
require_relative "patients/client"

module CandidApiClient
  module PreEncounter
    module Patients
      module V1
        class Client
          # @return [CandidApiClient::PreEncounter::Patients::V1::PatientsClient]
          attr_reader :patients

          # @param request_client [CandidApiClient::RequestClient]
          # @return [CandidApiClient::PreEncounter::Patients::V1::Client]
          def initialize(request_client:)
            @patients = CandidApiClient::PreEncounter::Patients::V1::PatientsClient.new(request_client: request_client)
          end
        end

        class AsyncClient
          # @return [CandidApiClient::PreEncounter::Patients::V1::AsyncPatientsClient]
          attr_reader :patients

          # @param request_client [CandidApiClient::AsyncRequestClient]
          # @return [CandidApiClient::PreEncounter::Patients::V1::AsyncClient]
          def initialize(request_client:)
            @patients = CandidApiClient::PreEncounter::Patients::V1::AsyncPatientsClient.new(request_client: request_client)
          end
        end
      end
    end
  end
end
