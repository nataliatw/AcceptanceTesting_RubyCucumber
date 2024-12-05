When('the page loads') do
    # Measure page load time if needed
  end

  Then('the page should load within 3 seconds') do
    Capybara.using_wait_time(3) do
      start_time = Time.now
      expect(page).to have_content('Terpopuler', wait: 3) # Tunggu konten utama muncul
      load_time = Time.now - start_time
      puts "Page load time: #{load_time} seconds"
      expect(load_time).to be <= 3
    end
  end
