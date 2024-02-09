# frozen_string_literal: true

module ExceptionHandler
  extend ActiveSupport::Concern
  included do
    rescue_from StandardError, with: :handle_exception
  end

  private

  def handle_exception(exception)
    if exception.is_a?(ApiExceptions::BaseException)
      handle_api_exception(exception)
    else
      handle_uncaught_exception(exception)
    end
  end

  def handle_api_exception(exception)
    body = build_response_error(
      exception.status,
      exception.code,
      exception.errors,
      exception.message
    )

    render json: body, status: exception.status
  end

  def handle_uncaught_exception(exception)
    raise exception if Rails.env.development?

    body = build_response_error(
      ApiCodes::INTERNAL_SERVER_ERROR,
      ApiCodes::INTERNAL_SERVER_ERROR,
      ['An unexpected error occurred. Please try again later.'],
      'Internal Server Error'
    )

    render json: body, status: :internal_server_error
  end

  def build_response_error(code, code_number, errors, message)
    {
      success: false,
      status: {
        code: code,
        message: message,
        sub_code: code_number
      },
      errors: errors
    }.to_json
  end
end
