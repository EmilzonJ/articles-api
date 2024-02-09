# frozen_string_literal: true

module Api::V1
  class CategoryBlueprint < Blueprinter::Base
    identifier :id

    fields :name
  end
end
