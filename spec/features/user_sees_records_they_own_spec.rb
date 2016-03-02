require 'rails_helper'

feature 'user sees records on own page' do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:album1) { FactoryGirl.create(:album) }
  let!(:album2) { FactoryGirl.create(:album) }
  let!(:album3) { FactoryGirl.create(:album) }

  before do
    visit root_path
  end
  scenario 'non signed in' do
