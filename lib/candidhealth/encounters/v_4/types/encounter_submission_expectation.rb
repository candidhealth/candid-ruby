# frozen_string_literal: true

module CandidApiClient
  module Encounters
    module V4
      module Types
        # Used to describe the currently expected target form for this encounter.  This
        #  effects what
        #  validations and queues the form is processed under.  If you're not sure, you can
        #  set this value
        #  to UNEXPECTED, in which case the form will be treated loosely during processing.
        #  Before
        #  submission, this value will be required by some rules or user intervention.  It
        #  can be changed
        #  at any time, although doing so may incur other rules.
        class EncounterSubmissionExpectation
          TARGET_PROFESSIONAL = "TARGET_PROFESSIONAL"
          TARGET_INSTITUTIONAL = "TARGET_INSTITUTIONAL"
        end
      end
    end
  end
end
