require_relative 'spec_helper'
require_relative '../models/link'

describe Link do
     it 'should have a title' do
       should respond_to(:title)
     end

    it 'should have a url' do
      should respond_to(:url)
    end


    it 'should create and retrieve from the db' do
      expect(Link.count).to eq(0)
      Link.create(title: 'Makers Academy', url: 'http://www.makersacademy.com')
      expect(Link.count).to eq(1)
      link = Link.first
      expect(link.url).to eq('http://www.makersacademy.com')
      expect(link.title).to eq('Makers Academy')
      link.destroy
      expect(Link.count).to eq(0)
    end
end