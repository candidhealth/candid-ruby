# frozen_string_literal: true

module Candid
  module Superbills
    module V1
      module Types
        module SuperbillOutputFormat
          extend Candid::Internal::Types::Enum

          DOCX = "DOCX"
          PDF = "PDF"
        end
      end
    end
  end
end
