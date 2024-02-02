require 'rails_helper'

RSpec.describe 'Artists song Index' do 
    before :each do
        @brandy = Artist.create!(name: 'Brandy')
        @friend = @brandy.songs.create!(title: 'Best Friend', length: 180, play_count: 1000)
        @say = @brandy.songs.create!(title: 'Say You Will', length: 190, play_count: 900)
    end

    it 'shows all of the song titles for the artist' do
        visit "/artists/#{@brandy.id}/songs"

        expect(page).to have_content(@friend.title)
        expect(page).to have_content(@say.title)
    end

    it 'links each song to its own show page' do
        visit "/artists/#{@brandy.id}/songs"

        click_on @friend.title

        expect(current_path).to eq("/songs/#{@friend.id}")
    end
end