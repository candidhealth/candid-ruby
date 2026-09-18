# frozen_string_literal: true

module Candid
  module PreServiceRules
    module V1
      module Types
        # Enough information for a client to choose a pipeline_id to submit on a pre-service run.
        class PreServicePipelineSummary < Internal::Types::Model
          field :id, -> { String }, optional: false, nullable: false
          field :name, -> { String }, optional: false, nullable: false
          field :run_type, -> { Candid::PreServiceRules::V1::Types::PreServiceRunType }, optional: false, nullable: false
        end
      end
    end
  end
end
