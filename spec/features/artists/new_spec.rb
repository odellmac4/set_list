require 'rails_helper'

RSpec.describe 'Artist creation' do
    xit 'links to new page from artist index' do
        visit '/artists'

        click_link('New Artist')
        expect(current_path).to eq('/artist/new')
    end

    it 'can create new artist' do
        visit '/artists/new'

        fill_in('Name', with: 'Prince')

        click_button('Create Artist')

        expect(current_path).to eq("/artists")
        expect(page).to have_content('Prince')
    end
end