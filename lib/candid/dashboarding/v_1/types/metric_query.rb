# frozen_string_literal: true

module Candid
  module Dashboarding
    module V1
      module Types
        # A request for a single metric.
        class MetricQuery < Internal::Types::Model
          field :metric, -> { Candid::Dashboarding::V1::Types::MetricName }, optional: false, nullable: false
          field :snapshot, -> { Candid::Dashboarding::V1::Types::MetricSnapshot }, optional: true, nullable: false
        end
      end
    end
  end
end
