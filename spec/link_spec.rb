require_relative 'spec_helper'
require_relative '../models/link'

describe Link do
     it 'should have a title' do
       should respond_to(:title)
     end

    it 'should have a url' do
      should respond_to(:url)
    end

end