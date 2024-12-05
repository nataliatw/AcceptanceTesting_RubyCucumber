When('I resize the browser to mobile size') do
    page.driver.browser.manage.window.resize_to(375, 667)
  end
  
  Then('the homepage should be displayed correctly on mobile') do
    expect(page).to have_css('.search--header', wait: 5)
  end
  