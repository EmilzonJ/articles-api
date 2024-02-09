class ApplicationController < ActionController::API
  include SuccessHandler
  include ApiExceptions
  include ExceptionHandler
end
