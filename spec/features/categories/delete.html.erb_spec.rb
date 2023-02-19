require 'rails_helper'
RSpec.describe 'Categories/delete', type: :feature do
  before do
    @category = Category.create(name: 'category name');
    visit delete_category_path(@category)
  end
  context 'delete page' do
    it 'shows delete category title' do
      expect(page).to have_content('Delete Category')
    end
    it 'shows delete category message' do
      expect(page).to have_text('Are you sure you want to delete this Category?')
    end
    it 'shows category name' do
      expect(page).to have_content('category name')
    end
    it 'shows delete button' do
      expect(page).to have_selector(:link_or_button, 'Delete Category', exact: true)
    end
    it 'shows back button' do
      expect(page).to have_selector(:link_or_button, 'Back to Categories', exact: true)
    end
  end
  context 'delete category' do
    it 'shows if category name deleted' do
      click_button 'Delete Category'
      expect(page).to have_current_path(categories_path)
      expect(page).to have_no_content('category name')
    end
  end
end