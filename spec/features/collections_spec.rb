require 'rails_helper'

describe 'Collection' do

  context 'by authorized user' do
    before(:each) { sign_in_user }

    scenario 'create shared collection and see it on root page' do
      visit collections_path
      click_link 'Добавить коллекцию'
      fill_in 'Название', with: 'Новая колекция'
      check 'Поделиться'
      click_button 'Создать'
      expect(page).to have_content 'Создание прошло успешно'
      visit root_path
      expect(page).to have_content 'Новая колекция'
    end

    scenario 'create shared collection and not see it on root page' do
      visit collections_path
      click_link 'Добавить коллекцию'
      fill_in 'Название', with: 'Новая колекция'
      click_button 'Создать'
      expect(page).to have_content 'Создание прошло успешно'
      visit root_path
      expect(page).to_not have_content 'Новая колекция'
    end

    scenario 'create without data and see error' do
      visit collections_path
      click_link 'Добавить коллекцию'
      click_button 'Создать'
      expect(page).to have_css '.alert.alert-danger'
    end
  end

  scenario 'by not authorized user visit collection page and see error' do
    visit collections_path
    expect(page).to have_content 'Вам необходимо войти в систему или зарегистрироваться.'
  end
end
