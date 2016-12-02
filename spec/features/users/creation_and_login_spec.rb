require 'rails_helper'
require 'support/factory_girl'

def t(string, options={})
  I18n.t(string, options)
end

feature 'Users login and creation' do
  scenario 'create user' do
    visit welcome_path  
    click_on t('Registration')    
    fill_in 'Email', with: 'mail@mail.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'     
    click_on t('Create_user')    
    expect(page).to have_content t('Hello')+', mail@mail.com'      
  end 
  
  scenario 'users login' do
    user = create(:user) 
    visit welcome_path 
    click_on t('Login')
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'password'   
    click_on t('Log')
    expect(page).to have_content t('Hello')+', '+user.email
  end  
end
