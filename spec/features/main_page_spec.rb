require 'full_helper'

feature 'Главная страница' do
  scenario 'Открывается' do
    visit root_url
    expect(page).to have_content 'Дронни'
  end
end
