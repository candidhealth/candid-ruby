# frozen_string_literal: true

module CandidApiClient
  module Commons
    module Types
      # The medium (paper or electronic) via which we intended to submit the claim. The
      #  clearinghouse to which we sent the claim may use a different medium in certain
      #  cases, e.g., if the payer does not support electronic claims.
      class IntendedSubmissionMedium
        PAPER = "paper"
        ELECTRONIC = "electronic"
      end
    end
  end
end
