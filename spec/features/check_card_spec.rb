require 'rails_helper'
require 'support/factory_girl'

feature 'Check translation' do  
  before do
    user = create(:user) 
    visit root_path
    click_on I18n.t(:Login)
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'password'
    click_on I18n.t(:Log)
    expect(page).to have_content I18n.t(:Succesfully_logined)
    card = create(:card, user: user)     
    click_on 'Проверка'        
  end
   
  scenario 'right translation' do    
    expect(page).to have_content 'nicht'
    fill_in I18n.t(:Translated_text), with: 'not'
    click_on I18n.t(:Send)
    expect(page).to have_content 'Правильно.'  
  end

  scenario 'wrong translation' do  
    expect(page).to have_content 'nicht'    
    fill_in I18n.t(:Translated_text), with: 'yes'
    click_on I18n.t(:Send)
    expect(page).to have_content 'Не правильно.' 
  end
end