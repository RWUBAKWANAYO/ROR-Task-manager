require 'rails_helper'
RSpec.describe 'Tasks/index', type: :feature do
  before do
    @category = Category.create(name: 'category name')
    @task = Task.create(name: 'task name', description: 'task description',
                        category_id: @category.id, position: 1, completed: false)
  end
  context 'index' do
    it 'shows all tasks' do
      visit tasks_path
      expect(page).to have_content('task name')
      expect(page).to have_content('category name')
      expect(page).to have_content('No')
      expect(page).to have_content('Actions')
      expect(page).to have_content('Back to Home')
      expect(page).to have_content('Add New Task')
      expect(page).to have_content('Show')
      expect(page).to have_content('Edit')
      expect(page).to have_content('Delete')

    end
    
  end
end