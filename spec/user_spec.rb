require_relative 'spec_helper'
require_relative '../models/user'

describe User do

  it 'should have a email' do
    should respond_to(:email)
  end

end