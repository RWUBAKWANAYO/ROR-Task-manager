require 'rails_helper'
RSpec.describe Task, type: :model do
  subject do
    @category = Category.create(name: 'category name')
    Task.new(name: 'task name', description: 'task description',
             category_id: @category, position: 1, completed: false)
  end
  before { subject.save }

  context 'associations' do
    it 'belongs to category' do
      assc = described_class.reflect_on_association(:category)
      expect(assc.macro).to eq :belongs_to
    end
  end

  context 'scopes' do
    it 'returns all tasks' do
      expect(Task.all) == ([subject])
    end
    it 'returns tasks by position' do
      expect(Task.order(:position)) == ([subject])
    end
  end

  context 'validations' do
    it 'is valid with valid attributes' do
      subject.category = @category
      expect(subject).to be_valid
    end
    it 'is not valid without a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end
    it 'is not valid without a description' do
      subject.description = nil
      expect(subject).to_not be_valid
    end
    it 'is not valid without a category_id' do
      subject.category_id = nil
      expect(subject).to_not be_valid
    end
    it 'is not valid without a position' do
      subject.position = nil
      expect(subject).to_not be_valid
    end
    it 'is not valid without a completed' do
      subject.completed = nil
      expect(subject).to_not be_valid
    end
  end
end
