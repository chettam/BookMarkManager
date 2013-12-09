require_relative 'spec_helper'
require_relative '../models/link'

describe Tag do
  it 'should have a title' do
    should respond_to(:text)
  end
end