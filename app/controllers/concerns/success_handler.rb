# frozen_string_literal: true

module SuccessHandler
  extend ActiveSupport::Concern

  def success_response(data: nil, message: 'Ok', code: ApiCodes::SUCCESS, status: 200)
    validate_data!(data)

    render json: {
      success: true,
      status: {
        code: status,
        message: message,
        sub_code: code || ApiCodes::SUCCESS
      },
      data: data
    }, status: status
  end

  def validate_data!(data)
    validate_presence_of_data data
    validate_data_is_hash_or_array_of_hashes data
    validate_not_primitive data
  end

  private

  def validate_presence_of_data(data)
    return unless data.nil? || (data.is_a?(Hash) && data.empty?)

    raise ArgumentError, 'Data should be a non-empty hash or an array of hashes'
  end

  def validate_data_is_hash_or_array_of_hashes(data)
    return unless data.is_a?(Array) && !data.all? { |item| item.is_a?(Hash) }

    raise ArgumentError, 'All items in the data array should be hashes'
  end

  def validate_not_primitive(data)
    return unless data.is_a?(String) || data.is_a?(Numeric) || data.is_a?(Symbol)

    raise ArgumentError, 'Data should not be a primitive value (string, number, or symbol)'
  end
end
