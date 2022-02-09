feature 'Viewing Bookmarks' do
    scenario 'visiting the index page' do
        visit('/bookmark')
        expect(page).to have_content "Bookmark Manager"
    end
end