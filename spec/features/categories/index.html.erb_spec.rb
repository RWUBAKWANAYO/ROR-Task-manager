require 'rails_helper'
RSpec.describe 'Categories/index', type: :feature do
  before do
    @category = Category.create(name: 'category name')
    visit categories_path
  end

  context 'index page' do
    it 'shows categories title' do
      expect(page).to have_content('Categories')
    end

    it 'shows back button' do
      expect(page).to have_selector(:link_or_button, 'Back to Home', exact: true)
    end
    it 'shows new category button' do
      expect(page).to have_selector(:link_or_button, 'Add new Category', exact: true)
    end
    it 'shows category name' do
      expect(page).to have_text('category name')
    end
    it 'shows edit button' do
      expect(page).to have_selector(:link_or_button, 'Edit', exact: true)
    end
    it 'shows delete button' do
      expect(page).to have_selector(:link_or_button, 'Delete', exact: true)
    end
  end
end
