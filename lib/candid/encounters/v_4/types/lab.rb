# frozen_string_literal: true

module Candid
  module Encounters
    module V4
      module Types
        class Lab < Internal::Types::Model
          field :name, -> { String }, optional: false, nullable: false
          field :code, -> { String }, optional: true, nullable: false
          field :code_type, -> { Candid::Encounters::V4::Types::LabCodeType }, optional: true, nullable: false

        end
      end
    end
  end
end
