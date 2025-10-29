# frozen_string_literal: true

module Candid
  module Tasks
    module V3
      module Types
        class TaskNote < Internal::Types::Model
          field :task_note_id, -> { String }, optional: false, nullable: false
          field :text, -> { String }, optional: false, nullable: false
          field :created_at, -> { String }, optional: false, nullable: false
          field :author_name, -> { String }, optional: false, nullable: false
          field :author_organization_name, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
