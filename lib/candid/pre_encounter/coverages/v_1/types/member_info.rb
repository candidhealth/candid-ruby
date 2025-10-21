# frozen_string_literal: true

module Candid
  module PreEncounter
    module Coverages
      module V1
        module Types
          class MemberInfo < Internal::Types::Model
            field :member_id, -> { String }, optional: true, nullable: false
            field :first_name, -> { String }, optional: false, nullable: false
            field :last_name, -> { String }, optional: false, nullable: false
            field :date_of_birth, -> { String }, optional: true, nullable: false

          end
        end
      end
    end
  end
end
