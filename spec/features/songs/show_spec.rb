require 'rails_helper'

RSpec.describe 'the songs show page' do
    it 'displays the song title' do
        artist = Artist.create!(name: "Michael Jackson")
        song = artist.songs.create!(title: "Bad", length: 160, play_count: 700)
        visit "/songs/#{song.id}"
        song_2 = artist.songs.create!(title: "Butterflies", length: 190, play_count: 500)
        
        visit "/songs/#{song.id}"

        expect(page).to have_content(song.title)
        expect(page).to_not have_content(song_2.title)
    end

    it 'displays the name of the artist for the song' do
        artist = Artist.create!(name: "Michael Jackson")
        song = artist.songs.create!(title: "Bad", length: 160, play_count: 700)
        visit "/songs/#{song.id}"
        song_2 = artist.songs.create!(title: "Butterflies", length: 190, play_count: 500)

        visit "/songs/#{song.id}"
        save_and_open_page
        expect(page).to have_content(artist.name)
    end
end