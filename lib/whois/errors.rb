#
# = Ruby Whois
#
# An intelligent pure Ruby WHOIS client and parser.
#
#
# Category::    Net
# Package::     Whois
# Author::      Simone Carletti <weppos@weppos.net>
# License::     MIT License
#
#--
#
#++


module Whois

  # The base error class for all Whois error classes.
  class Error < StandardError
  end
  
  
  # Generic Server exception class.
  class ServerError < Error
  end
  
  # Server Definition not found
  
  # Raised when the class hasn't been able to select a valid server
  # probably because definitions are outdated.
  class ServerNotFound < ServerError
  end
  
  # Server Definition found
  
  class InterfaceNotSupported < ServerError
  end
  
  # Raised when a server is known to not be available for this kind of object
  # or because this specific object doesn't support WHOIS. (\x03)
  class NoInterfaceError < InterfaceNotSupported
  end
  
  # Raised when the class has found a server but it doesn't support the
  # standard whois interface via port 43. This is the case of some
  # specific domains that only provide a web–based WHOIS interface. (\x01)
  class WebInterfaceError < InterfaceNotSupported
  end

  # Server Known object, Definition unavailable

  # Raised when we know about a specific functionality
  # but this functionality has not been implemented yet.
  # This is usually the result of a porting from a third-party library.
  class ServerNotImplemented < ServerError
  end

  # Raised when no whois server is known for this kind of object. (\x05)
  class ServerNotSupported < ServerError
  end
  
  # Raised when unknown AS numer of IP network. (\x06)
  class AllocationUnknown < ServerError
  end
  
  
  # Generic Parser exception class.
  class ParserError < Error
  end
  
  # Raised when the class hasn't been able to load a valid parser
  # according to current settings.
  class ParserNotFound < ParserError
  end

  # Raised when the property method has not been overwritten (implemented)
  # in a child parser class.
  class PropertyNotImplemented < ParserError
  end

  # Raised when you are trying to access a property that is not supported
  # by any of the parsers available for current WHOIS answer.
  class PropertyNotSupported < ParserError
  end

end