require 'rails_helper'
RSpec.describe 'Tasks/new', type: :feature do
  before do
    @category = Category.create(name: 'category name')
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
      expect(page).to have_content('Create Task')
    end
    it 'creates a new task' do
      visit new_task_path
      fill_in 'Name', with: 'task name'
      fill_in 'Description', with: 'task description'
      select 'category name', from: 'Category'
      fill_in 'Position', with: 1
      click_button 'Create Task'
      expect(page).to have_current_path(tasks_path)
    end
  end
end