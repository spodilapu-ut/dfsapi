class AuthorizeApiRequest 
  def initialize(headers = {})
    @headers = headers
  end

  # Service entry point - return valid user object
  def call
    {
      user: user
    }
  end

  private

  attr_reader :headers

  def user
    # check if user is in the database
    # memoize user object
    @user ||= User.find(decoded_auth_token[:user_id]) if decoded_auth_token
    # puts "#{decoded_auth_token[:user_id]}"
    # puts "User: #{@user}"
    # handle user not found
  rescue ActiveRecord::RecordNotFound => e
    # raise custom error
    raise(
      ExceptionHandler::InvalidToken,
      ("#{Message.invalid_token} #{e.message}")
    )
  end

  # decode authentication token
  def decoded_auth_token
    #puts "Token: #{http_auth_header}"
    #@decoded_auth_token ||= JsonWebToken.decode(http_auth_header)
    #@decoded_auth_token ||= JsonWebToken.verify(http_auth_header, key: 'gZH75aKtMN3Yj0iPS4hcgUuTwjAzZr9C')
    @decoded = JsonWebToken.verify(http_auth_header, key: 'gZH75aKtMN3Yj0iPS4hcgUuTwjAzZr9C')[:ok]
    # puts "Decoded: #{@decoded}"
  end

  # check for token in `Authorization` header
  def http_auth_header
    if headers['Authorization'].present?
      return headers['Authorization'].split(' ').last
    end
      raise(ExceptionHandler::MissingToken, Message.missing_token)
  end
end
