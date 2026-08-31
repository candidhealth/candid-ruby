# frozen_string_literal: true

module Candid
  module Dashboarding
    module V1
      module Types
        # Result for a single metric query.
        class MetricResult < Internal::Types::Model
          field :metric, -> { Candid::Dashboarding::V1::Types::MetricName }, optional: false, nullable: false
          field :value, -> { Object }, optional: true, nullable: false
          field :snapshot, -> { Candid::Dashboarding::V1::Types::MetricSnapshot }, optional: true, nullable: false
          field :error, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
