require 'rails_helper'

RSpec.describe Question, type: :model do
  it 'validate presence of title' do
    expect(Question.new(body: 'Qwerr')).to_not be_valid
  end

  it 'validate presence of body' do
    expect(Question.new(title: 'Qwerr')).to_not be_valid
  end

  it { should validate_presence_of :title }
  it { should validate_presence_of :body }

end
