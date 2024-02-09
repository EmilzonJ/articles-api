# frozen_string_literal: true

module LimitOffsetPaginationConcern
  include Pagy::Backend
  include ApiExceptions
  extend ActiveSupport::Concern

  # @param blueprint [Class < Blueprinter::Base]
  # @param page [Integer]
  # @param limit [Integer]
  # @return [Hash]
  def limit_page_paginate(blueprint:, page:, limit:)
    page = get_page_validated!(page)
    limit = get_limit_validated!(limit)
    validate_blueprint!(blueprint)
    validate_items_presence!(@items)
    ensure_items_is_an_ar_relation!(@items)

    pagy, items = pagy(@items, page: page, items: limit)

    build_response(blueprint, pagy, items)
  end

  private

  def validate_blueprint!(blueprint)
    return if blueprint.ancestors.include?(Blueprinter::Base)

    raise ArgumentError, 'blueprinter must be a Blueprinter::Base'
  end

  def validate_items_presence!(items)
    raise ArgumentError, '@items cannot be nil' if items.nil?
  end

  def ensure_items_is_an_ar_relation!(items)
    return if items.is_a?(ActiveRecord::Relation)

    raise ArgumentError, '@items must be an ActiveRecord::Relation'
  end

  def get_page_validated!(page)
    if page.nil?
      1
    else
      validate_page!(page)
      page.to_i
    end
  end

  def get_limit_validated!(limit)
    if limit.nil?
      20
    else
      validate_limit!(limit)
      limit.to_i
    end
  end

  def validate_page!(page)
    return if page.to_i.is_a?(Integer) && page.to_i.positive?

    raise BadRequestError.new(errors: ['page must be a positive integer'])
  end

  def validate_limit!(limit)
    return if limit.to_i.is_a?(Integer) && limit.to_i.positive?

    raise BadRequestError.new(errors: ['limit must be a positive integer'])
  end

  def build_response(blueprint, pagy, items)
    {
      items: blueprint.render_as_hash(items),
      pagination: pagy_response(pagy)
    }
  end

  def pagy_response(pagy)
    {
      currentPage: pagy.page,
      itemsPerPage: pagy.items,
      totalItems: pagy.count,
      totalPages: pagy.pages,
      nextPage: pagy.next,
      prevPage: pagy.prev,
      fromItem: pagy.from,
      toItem: pagy.to
    }
  end
end

