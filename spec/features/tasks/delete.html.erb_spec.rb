require 'rails_helper'
RSpec.describe 'Tasks/delete', type: :feature do
  before do
    @category = Category.create(name: 'category name')
    @task = Task.create(name: 'task name', description: 'task description',
                        category_id: @category.id, position: 1, completed: false)
    visit delete_task_path(@task)
  end

  context 'delete page' do
    it 'shows delete title' do
      expect(page).to have_content('Delete Task')
    end
    it 'shows delete message' do
      expect(page).to have_text('Are you sure you want to delete this Tasks?')
    end
    it 'shows task name' do
      expect(page).to have_text('task name')
    end
    it 'shows delete button' do
      expect(page).to have_selector(:link_or_button, 'Delete Task', exact: true)
    end
    it 'shows back button' do
      expect(page).to have_selector(:link_or_button, 'Back To list', exact: true)
    end

  end
  context 'delete task' do
    it 'go back to tasks' do
      click_button 'Delete Task'
      expect(page).to have_current_path(tasks_path)
    end
    it 'shows deleted task name' do
      click_button 'Delete Task'
      expect(page).to have_no_content('task name')
    end
  end
end
