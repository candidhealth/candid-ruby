# frozen_string_literal: true

module Candid
  module Eras
    module Types
      class EraDocument < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
        field :source, -> { String }, optional: false, nullable: false
        field :storage_path, -> { String }, optional: false, nullable: false
        field :status, -> { Candid::EraCommons::Types::EraDocumentStatus }, optional: false, nullable: false
      end
    end
  end
end
