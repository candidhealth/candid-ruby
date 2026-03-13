# frozen_string_literal: true

module Candid
  module PatientRefunds
    module V1
      module Types
        module PatientRefundId
          # PatientRefundId is an alias for String

          # @option str [String]
          #
          # @return [untyped]
          def self.load(str)
            ::JSON.parse(str)
          end

          # @option value [untyped]
          #
          # @return [String]
          def self.dump(value)
            ::JSON.generate(value)
          end
        end
      end
    end
  end
end
