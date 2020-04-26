module MyApi
  class ApplicationController < ActionController::API
    include Response
    include ExceptionHandler
    include CRUDOperations
  end
end
