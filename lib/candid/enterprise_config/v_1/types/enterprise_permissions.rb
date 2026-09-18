# frozen_string_literal: true

module Candid
  module EnterpriseConfig
    module V1
      module Types
        # Derived write permissions for the requesting organization, based on its enterprise configuration.
        class EnterprisePermissions < Internal::Types::Model
          field :write_queues, -> { Internal::Types::Boolean }, optional: false, nullable: false
          field :write_rules, -> { Internal::Types::Boolean }, optional: false, nullable: false
          field :write_cross_customer_rules, -> { Internal::Types::Boolean }, optional: false, nullable: false
        end
      end
    end
  end
end
