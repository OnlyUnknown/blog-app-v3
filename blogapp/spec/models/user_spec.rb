require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name:"Tom", photo:"Link", bio:"bio", posts_counter: 5)}
  before {subject.save}
  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  
  it 'posts_counter should be integer' do
    subject.posts_counter = "asdf"
    expect(subject).to_not be_valid
  end

  it 'posts_counter should be greater than or equal zero' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end 

  it 'name should eq Tom' do
    expect(subject.name).to eq("Tom")
  end

  it 'photo should eq to Link' do
    expect(subject.photo).to eq("Link")
  end
  it 'bio should eq to bio' do
    expect(subject.bio).to eq("bio")
  end
  it 'posts_counter should equal to 5' do
    expect(subject.posts_counter).to equal(5)
  end

end
