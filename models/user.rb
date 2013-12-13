require 'bcrypt'
class User
  include DataMapper::Resource

  attr_reader   :password
  attr_accessor :password_confirmation
  validates_confirmation_of :password,message:'Sorry, your passwords don\'t match'
  validates_uniqueness_of :email,message:  'This email is already taken'

  property :id, Serial
  property :email,  String,:unique => true,message: 'This email is already taken'
  property :password_digest, Text
  property :password_token, Text
  property :password_token_timestamp, String



  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    user = first(:email => email)
    # if this user exists and the password provided matches
    # the one we have password_digest for, everything's fine
    #
    # The Password.new returns an object that overrides the ==
    # method. Instead of comparing two passwords directly
    # (which is impossible because we only have a one-way hash)
    # the == method calculates the candidate password_digest from
    # the password given and compares it to the password_digest
    # it was initialised with.
    # So, to recap: THIS IS NOT A STRING COMPARISON
    if user && BCrypt::Password.new(user.password_digest) == password
      # return this user
      user
    else
      nil
    end
  end

end