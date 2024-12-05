Given('I am on the Kompas homepage') do
  visit("https://www.kompas.com")
end

When('I search for {string}') do |query|
  search_box = find('input.form__input.form__input__header#search', wait: 5)
  search_box.fill_in with: query
  search_box.send_keys(:enter) # Tekan Enter untuk memulai pencarian
end

Then('I should be redirected to the search results page') do
  expect(page).to have_current_path(/search.kompas.com\/search/, url: true)
end

Then('I should see search results related to {string}') do |query|
  expect(page).to have_css('.gsc-webResult.gsc-result', wait: 10)
  search_results = all('.gsc-webResult.gsc-result .gs-title').map(&:text).map(&:downcase)
  puts "Search results: #{search_results}" # Debugging
  expect(search_results.any? { |result| result.include?(query.downcase) }).to be true
end

Then('I should see suggestions related to {string}') do |suggested_query|
  expect(page).to have_css('.gsc-webResult.gsc-result', wait: 10)
  search_results = all('.gsc-webResult.gsc-result .gs-title').map(&:text).map(&:downcase)
  puts "Search results: #{search_results}" # Debugging
  expect(search_results.any? { |result| result.include?(suggested_query.downcase) }).to be true
end

When('I click on the first news article') do
  first_article = find('.gsc-webResult.gsc-result .gs-title', match: :first)
  first_article.click
end

Then('I should be redirected to the article page') do
  expect(page).to have_current_path(/kompas.com\/read/, url: true, wait: 10)
end

Then('I should see the content of the article') do
  expect(page).to have_css('.read__content', wait: 10)
  content = find('.read__content').text
  expect(content).not_to be_empty
end