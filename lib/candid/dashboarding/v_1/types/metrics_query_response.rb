# frozen_string_literal: true

module Candid
  module Dashboarding
    module V1
      module Types
        # Results for each queried metric.
        class MetricsQueryResponse < Internal::Types::Model
          field :results, -> { Internal::Types::Array[Candid::Dashboarding::V1::Types::MetricResult] }, optional: false, nullable: false
        end
      end
    end
  end
end
