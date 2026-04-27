# frozen_string_literal: true

module Candid
  class Environment
    PRODUCTION = { candid_api: "https://api.joincandidhealth.com", pre_encounter: "https://pre-api.joincandidhealth.com" }.freeze
    STAGING = { candid_api: "https://api-staging.joincandidhealth.com", pre_encounter: "https://pre-api-staging.joincandidhealth.com" }.freeze
    CANDID_SANDBOX = { candid_api: "https://sandbox-api.joincandidhealth.com", pre_encounter: "https://sandbox-pre-api.joincandidhealth.com" }.freeze
    CANDID_STAGING = { candid_api: "https://staging-api.joincandidhealth.com", pre_encounter: "https://staging-pre-api.joincandidhealth.com" }.freeze
    LOCAL = { candid_api: "http://localhost:5050", pre_encounter: "http://localhost:4000" }.freeze
  end
end
