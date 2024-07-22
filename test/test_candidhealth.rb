# frozen_string_literal: true

require_relative "test_helper"
require "candidhealth"

# Basic CandidApiClient tests
class TestCandidApiClient < Minitest::Test
  def test_guarantor
    skip "No credentials provided in CI!"

    candidhealth = CandidApiClient::Client.new(client_id: "YOUR_CLIENT_ID", client_secret: "YOUR_CLIENT_SECRET", environment: CandidApiClient::Environment::STAGING)
    provider = candidhealth.organization_providers.v_3.get(organization_provider_id: "2147ebc7-9dae-44f9-9600-8b5b932aa1f8")
    assert !provider.first_name.nil?
    assert provider.npi == "1234567890"
  end
end
