# frozen_string_literal: true

module CandidApiClient
  module ExpectedNetworkStatus
    module V2
      module Types
        class Explanation
          ROUTING_FAILED = "Payer Routing and/or Billing Provider Routing Failed"
          PAYER_MATCH_FAILED = "No Effective Contract with Payer"
          BILLING_PROVIDER_MATCH_FAILED = "No Effective Contract with Billing Provider"
          COVERED_GEOGRAPHY_MATCH_FAILED = "No Effective Contract with Covered Geography"
          LINE_OF_BUSINESS_MATCH_FAILED = "No Effective Contract with Line of Business"
          INSURANCE_TYPE_MATCH_FAILED = "No Effective Contract with Insurance Type"
          RENDERING_PROVIDER_MATCH_FAILED = "No Effective Contract with Rendering Provider"
          RENDERING_PROVIDER_CREDENTIALING_CHECK_FAILED = "Rendering Provider Not Credentialed"
        end
      end
    end
  end
end
