# frozen_string_literal: true

module Candid
  module PreEncounter
    module Coverages
      module V1
        module Types
          class ExpandedMemberInfo < Internal::Types::Model
            field :member_id, -> { String }, optional: true, nullable: false
            field :group_number, -> { String }, optional: true, nullable: false
            field :first_name, -> { String }, optional: true, nullable: false
            field :middle_name, -> { String }, optional: true, nullable: false
            field :last_name, -> { String }, optional: true, nullable: false
            field :date_of_birth, -> { String }, optional: true, nullable: false
            field :gender, -> { String }, optional: true, nullable: false
            field :address, -> { Candid::PreEncounter::Coverages::V1::Types::Address }, optional: true, nullable: false
          end
        end
      end
    end
  end
end
