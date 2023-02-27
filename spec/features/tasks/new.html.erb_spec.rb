require 'rails_helper'
RSpec.describe 'Tasks/new', type: :feature do
  before do
    @category = Category.create(name: 'category name')
    visit new_task_path
    fill_in 'Name', with: 'task name'
    fill_in 'Description', with: 'task description'
    select 'category name', from: 'Category'
    fill_in 'Position', with: 1
    click_button 'Create Task'
  end
  context 'new' do
    it 'shows new task form' do
      visit new_task_path
      expect(page).to have_content('Create Task')
      expect(page).to have_content('Name')
      expect(page).to have_content('Description')
      expect(page).to have_content('Category')
      expect(page).to have_content('Position')
      expect(page).to have_content('Completed')
      expect(page).to have_content('Back To list')
      expect(page).to have_selector(:link_or_button, 'Create Task', exact: true)
    end
    context 'creates a new task' do
      it 'go back to tasks' do
        expect(page).to have_current_path(tasks_path)
      end
      it 'shows the task name' do
        expect(page).to have_content('task name')
      end
      it 'shows the category name' do
        expect(page).to have_content('category name')
      end
      it 'shows completed status' do
        expect(page).to have_content('No')
      end
    end
  end
end
