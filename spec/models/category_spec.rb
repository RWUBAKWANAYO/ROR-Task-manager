require 'rails_helper'
RSpec.describe Category, type: :model do
  subject do
    Category.new(name: 'category name')
  end
  before { subject.save }
  context 'associations' do
    it 'has many tasks' do
      assc = described_class.reflect_on_association(:tasks)
      expect(assc.macro).to eq :has_many
    end
  end
  context 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end
    it 'is not valid without a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end
  end
end
