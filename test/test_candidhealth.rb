# frozen_string_literal: true

require_relative "test_helper"
require "candidhealth"

# Basic CandidApiClient tests
class TestCandidApiClient < Minitest::Test
  def test_function
    CandidApiClient::Client.new
  end
end
