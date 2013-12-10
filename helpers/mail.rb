module Helpers

  def send_simple_message(email,token)
    RestClient.post 'https://api:key-5fjkai3vz1axg1z3br5i7k2cgglno9e0'\
                    '@api.mailgun.net/v2/samples.mailgun.org/messages',
                    :from => 'Book Mark Manager <me@samples.mailgun.org>',
                    :to => 'bar@example.com, baz@example.com',
                    :subject => 'Reset Password',
                    :text => 'Testing some Mailgun awesomness!'
  end

end