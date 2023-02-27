require 'rails_helper'
RSpec.describe 'Tasks/index', type: :feature do
  before do
    @category = Category.create(name: 'category name')
    @task = Task.create(name: 'task name', description: 'task description',
                        category_id: @category.id, position: 1, completed: false)
    visit tasks_path
  end
  context 'index' do
    it 'shows task name' do
      expect(page).to have_content('task name')
    end
    it 'shows task category name ' do
      expect(page).to have_content('category name')
    end
    it 'shows task completed' do
      expect(page).to have_content('No')
    end
    it 'shows task actions' do
      expect(page).to have_content('Actions')
      expect(page).to have_content('Show')
      expect(page).to have_content('Edit')
      expect(page).to have_content('Delete')
    end
    it 'shows new task button' do
      expect(page).to have_selector(:link_or_button, 'Back to Home', exact: true)
      expect(page).to have_selector(:link_or_button, 'Add New Task', exact: true)
    end
  end
end
