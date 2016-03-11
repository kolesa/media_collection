require 'rails_helper'

describe 'Image' do
  let(:collection) { create(:share_collection) }

  context 'by authorized user' do
    before(:each) do
      sign_in_user
    end

    scenario 'create image and see it on collection page' do
      current_collection = collection
      visit collections_path
      click_link 'Добавить изображение'
      fill_in 'Название', with: 'Новая картинка'
      attach_file 'Картинка', Rails.root + 'spec/file/ruby.png'
      click_button 'Создать'
      expect(page).to have_content 'Создание прошло успешно'
      visit root_path
      click_link current_collection.name
      expect(page).to have_xpath("//img[@src=\"/uploads/image/image/#{current_collection.id}/thumb_ruby.png\"]")
    end

    scenario 'create without date and see error' do
      visit collections_path
      click_link 'Добавить изображение'
      click_button 'Создать'
      expect(page).to have_css '.alert.alert-danger'
    end
  end
end
