# frozen_string_literal: true

module Candid
  module EncounterSupplementalInformation
    module V1
      module Types
        module AttachmentInclusion
          extend Candid::Internal::Types::Enum

          NOT_INCLUDED = "not_included"
          INCLUDED_ON_NEXT_SUBMISSION = "included_on_next_submission"
          INCLUDED_ON_ALL_SUBMISSIONS = "included_on_all_submissions"
        end
      end
    end
  end
end
