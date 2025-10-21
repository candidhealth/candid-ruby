# frozen_string_literal: true

module Candid
  module Superbills
    module V1
      module Types
        class Superbill < Internal::Types::Model
          field :superbill_id, -> { String }, optional: false, nullable: false
          field :patient_external_id, -> { String }, optional: false, nullable: false
          field :authed_url, -> { String }, optional: false, nullable: false
          field :date_range_min, -> { String }, optional: false, nullable: false
          field :date_range_max, -> { String }, optional: false, nullable: false
          field :file_name, -> { String }, optional: false, nullable: false

        end
      end
    end
  end
end
