# frozen_string_literal: true

module Candid
  module Tags
    module Types
      class TagCreate < Internal::Types::Model
        field :tag_id, -> { String }, optional: false, nullable: false
        field :description, -> { String }, optional: false, nullable: false
        field :color, -> { Candid::Tags::Types::TagColorEnum }, optional: false, nullable: false
      end
    end
  end
end
