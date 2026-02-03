# frozen_string_literal: true

module Candid
  module PreEncounter
    module EligibilityChecks
      module V1
        module Types
          # Individual result from a single user-configured prompt execution
          class UserConfiguredPromptsResult < Internal::Types::Model
            field :user_prompt_id, -> { String }, optional: false, nullable: false
            field :prompt_name, -> { String }, optional: false, nullable: false
            field :structured_response, -> { Internal::Types::Hash[String, Object] }, optional: false, nullable: false
            field :exposition, -> { String }, optional: false, nullable: false
          end
        end
      end
    end
  end
end
