Given('I am reading a long article') do
  visit('https://lifestyle.kompas.com/read/2024/12/02/140700620/5-model-kacamata-yang-sedang-tren-ada-model-cat-eye')
end

When('I click the Show All button') do
  show_all_button = find('a.paging__link.paging__link--show', text: 'Show All')
  show_all_button.click
end

Then('the full content of the article should be displayed without pagination') do
  expect(page).to have_current_path('https://lifestyle.kompas.com/read/2024/12/02/140700620/5-model-kacamata-yang-sedang-tren-ada-model-cat-eye?page=all#page2', url: true)
  expect(page).to have_css('.read__content') # Validasi bahwa konten penuh artikel ditampilkan
end
