require 'rails_helper'

RSpec.describe "Songs Index Page", type: :feature do
    describe 'As a user' do
        it "I see each songs title and play count when I visit '/songs'" do
           #Arrange // Given
            artist = Artist.create!(name: 'Prince')
            purple = artist.songs.create!(title: 'Purple Rain', length: 845, play_count: 8599)
            beret = artist.songs.create!(title: 'Raspberry Beret', length: 665, play_count: 99)
            doves = artist.songs.create!(title: 'When Doves Cry', length: 240, play_count: 100000)

           #Act // When this happens
            visit "/songs"

           #Assert // Then
            expect(page).to have_content('Purple Rain')
            expect(page).to have_content('Raspberry Beret')
            expect(page).to have_content('When Doves Cry')

            expect(page).to have_content(purple.play_count)
            expect(page).to have_content(beret.play_count)
            expect(page).to have_content(doves.play_count)
        end
    end
end