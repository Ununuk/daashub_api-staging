module DaashubAPI
  class Error < StandardError; end
  class BadRequest < Error; end
  class UnauthorizedError < Error; end
  class PageNotFound < Error; end
  class InternalServerError < Error; end
end
