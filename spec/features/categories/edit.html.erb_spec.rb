require 'rails_helper'
RSpec.describe 'Categories/edit', type: :feature do
  before do
    @category = Category.create(name: 'category name')
    visit edit_category_path(@category)
  end

  context 'edit page' do
    it 'shows edit category title' do
      expect(page).to have_content('Edit Categories')
    end
    it 'shows edit category form' do
      expect(page).to have_selector('form')
    end
    it 'shows name label' do
      expect(page).to have_content('Name')
    end
    it 'shows name input' do
      expect(page).to have_selector('input#category_name')
    end
    it 'shows update button' do
      expect(page).to have_selector(:link_or_button, 'Update Category', exact: true)
    end
    it 'shows back button' do
      expect(page).to have_selector(:link_or_button, 'Back to Categories', exact: true)
    end
  end

  context 'update category' do
    it 'shows edited category name' do
      fill_in 'Name', with: 'category name'
      click_button 'Update Category'
      expect(page).to have_current_path(categories_path)
      expect(page).to have_content('category name')
    end
  end
end
