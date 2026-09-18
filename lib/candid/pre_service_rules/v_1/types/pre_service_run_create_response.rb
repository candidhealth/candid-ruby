# frozen_string_literal: true

module Candid
  module PreServiceRules
    module V1
      module Types
        # Returned after a successful pre-service run submission.
        class PreServiceRunCreateResponse < Internal::Types::Model
          field :run_id, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
