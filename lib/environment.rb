# frozen_string_literal: true

module CandidApiClient
  #  Environment service identifiers used as hash keys
  CandidApi = :CandidApi

  class Environment
    PRODUCTION = {
      CandidApi: "https://api.joincandidhealth.com",
      PreEncounter: "https://pre-api.joincandidhealth.com"
    }.freeze
    STAGING = {
      CandidApi: "https://api-staging.joincandidhealth.com",
      PreEncounter: "https://pre-api-staging.joincandidhealth.com"
    }.freeze
    CANDID_STAGING = {
      CandidApi: "https://staging-api.joincandidhealth.com",
      PreEncounter: "https://staging-pre-api.joincandidhealth.com"
    }.freeze
  end
end
