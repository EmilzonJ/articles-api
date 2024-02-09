# frozen_string_literal: true

module ApiExceptions
  class BaseException < StandardError
    attr_reader :status, :code, :message, :errors

    def initialize(code: nil, message: self.class::DEFAULT_MESSAGE, errors: nil)
      @code = code || self.class::DEFAULT_CODE
      @message = message
      @errors = errors
      @status = self.class::HTTP_STATUS
    end
  end

  class UnauthorizedError < BaseException
    HTTP_STATUS = 401
    DEFAULT_MESSAGE = 'Unauthorized'
    DEFAULT_CODE = ApiCodes::UNAUTHORIZED
  end

  class ForbiddenError < BaseException
    HTTP_STATUS = 403
    DEFAULT_MESSAGE = 'Forbidden'
    DEFAULT_CODE = ApiCodes::FORBIDDEN
  end

  class NotFoundError < BaseException
    HTTP_STATUS = 404
    DEFAULT_MESSAGE = 'Not Found'
    DEFAULT_CODE = ApiCodes::NOT_FOUND
  end

  class InternalServerError < BaseException
    HTTP_STATUS = 500
    DEFAULT_MESSAGE = 'Internal Server Error'
    DEFAULT_CODE = ApiCodes::INTERNAL_SERVER_ERROR
  end

  class TimeoutError < BaseException
    HTTP_STATUS = 504
    DEFAULT_MESSAGE = 'Request Timeout'
    DEFAULT_CODE = ApiCodes::TIMEOUT
  end

  class ConnectionError < BaseException
    HTTP_STATUS = 503
    DEFAULT_MESSAGE = 'Service Unavailable'
    DEFAULT_CODE = ApiCodes::SERVICE_UNAVAILABLE
  end

  class BadRequestError < BaseException
    HTTP_STATUS = 400
    DEFAULT_MESSAGE = 'Bad Request'
    DEFAULT_CODE = ApiCodes::BAD_REQUEST
  end

  class UnprocessableEntityError < BaseException
    HTTP_STATUS = 422
    DEFAULT_MESSAGE = 'Unprocessable Entity'
    DEFAULT_CODE = ApiCodes::UNPROCESSABLE_ENTITY
  end
end
