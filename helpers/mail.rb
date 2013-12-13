require 'rest-client'
require 'multimap'

module Helpers

  HOSTNAME= 'localhost:9393'

  def send_simple_message(email,token)

    data = Multimap.new
    data[:from] = 'BookMark Manager <me@samples.mailgun.org>'
    data[:to] = email
    data[:subject] = 'Reset Password'
    data[:html] = '<html><h1>Follow the link bellow to reset your password</h1>
        <a href="'+HOSTNAME+'/users/reset?token='+token+'">click here</a></html>'
    RestClient.post 'https://api:key-5fjkai3vz1axg1z3br5i7k2cgglno9e0'\
  '@api.mailgun.net/v2/sandbox2994.mailgun.org/messages', data


  end

end