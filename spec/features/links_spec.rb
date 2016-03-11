require 'rails_helper'

describe 'Link' do
  let(:collection) { create(:share_collection) }

  context 'by authorized user' do
    before(:each) do
      sign_in_user
    end

    scenario 'create link and see it on collection page' do
      current_collection = collection
      visit collections_path
      click_link 'Добавить ссылку'
      fill_in 'Название', with: 'Новая ссылка'
      fill_in 'Ссылка', with: 'http://ololo.ru'
      click_button 'Создать'
      expect(page).to have_content 'Создание прошло успешно'
      visit root_path
      click_link current_collection.name
      expect(page).to have_content 'Новая ссылка'
    end

    scenario 'create without date and see error' do
      visit collections_path
      click_link 'Добавить ссылку'
      click_button 'Создать'
      expect(page).to have_css '.alert.alert-danger'
    end
  end
end
