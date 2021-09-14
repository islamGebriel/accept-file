require 'rails_helper'

RSpec.describe 'FilesController', type: :routing do
  it 'get files#new' do
    expect(get: 'files/new').to route_to('files#new') 
  end
  
  it 'post files#create' do 
    expect(post: 'files').to route_to('files#create')
  end
end