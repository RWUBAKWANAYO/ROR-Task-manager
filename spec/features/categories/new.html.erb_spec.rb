require 'rails_helper'
RSpec.describe 'Categories/new', type: :feature do
  before do
    visit new_category_path
  end

  context 'new page' do
    it 'shows new category title' do
      expect(page).to have_content('New Category')
    end
    it 'shows new category form' do
      expect(page).to have_selector('form')
    end
    it 'shows name label' do
      expect(page).to have_content('Name')
    end
    it 'shows name input' do
      expect(page).to have_selector('input#category_name')
    end
    it 'shows create button' do
      expect(page).to have_selector(:link_or_button, 'Create Category', exact: true)
    end
    it 'shows back button' do
      expect(page).to have_selector(:link_or_button, 'Back to Categories', exact: true)
    end
  end
  context 'create category' do
    it 'shows new category name' do
      fill_in 'Name', with: 'category name'
      click_button 'Create Category'
      expect(page).to have_current_path(categories_path)
    end
  end
end
