require 'rails_helper'
RSpec.describe 'Tasks/edit', type: :feature do
  before do
    @category = Category.create(name: 'category name')
    @task = Task.create(name: 'task name', description: 'task description',
                        category_id: @category.id, position: 1, completed: false)

    visit edit_task_path(@task)
    fill_in 'Name', with: 'task name'
    fill_in 'Description', with: 'task description'
    select 'category name', from: 'Category'
    fill_in 'Position', with: 1
    click_button 'Update Task'
  end

  context 'edit' do
    it 'shows edit task form' do
      visit edit_task_path(@task)
      expect(page).to have_content('Edit Task')
      expect(page).to have_content('Name')
      expect(page).to have_content('Description')
      expect(page).to have_content('Category')
      expect(page).to have_content('Position')
      expect(page).to have_content('Completed')
      expect(page).to have_content('Back To list')
      expect(page).to have_selector(:link_or_button, 'Update Task', exact: true)
    end
    context 'updates a task' do
      it 'go back to tasks' do
        expect(page).to have_current_path(tasks_path)
      end
      it 'shows edited task name' do
        expect(@task.name).to eq('task name')
      end
      it 'shows edited task description' do
        expect(@task.description).to eq('task description')
      end
      it 'shows edited task category' do
        expect(@task.category_id).to eq(@category.id)
      end
      it 'shows edited task position' do
        expect(@task.position).to eq(1)
      end
    end
  end
end
