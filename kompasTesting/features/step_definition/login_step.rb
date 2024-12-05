Given('I am on the Kompas login page') do
    visit('https://account.kompas.com/login/')
  end
  
  When('I log in with valid credentials') do
    find('input[name="email"]').set('dewaayu0445@gmail.com')
    find('input[name="password"]').set('natalia08')
    find('input[type="submit"].button.-primary').click
  end
  
  Then('I should be redirected to the Kompas homepage') do
    # Menunggu hingga halaman dialihkan
    expect(page).to have_current_path(/https:\/\/www\.kompas\.com\//, url: true)
  end

  When('I log in with an empty {string}') do |field|
    if field == 'email'
      find('input[name="email"]').set('')
      find('input[name="password"]').set('natalia08')
    elsif field == 'password'
      find('input[name="email"]').set('dewaayu0445@gmail.com')
      find('input[name="password"]').set('')
    end
    find('input[type="submit"].button.-primary').click
  end
  
  Then('I should see an error message for empty {string}') do |field|
    if field == 'email'
      expect(page).to have_content('KG Media ID harus diisi') # Ubah sesuai dengan pesan error yang muncul
    elsif field == 'password'
      expect(page).to have_content('Password harus diisi') # Ubah sesuai dengan pesan error yang muncul
    end
  end
  
  When('I log in with invalid credentials') do
    find('input[name="email"]').set('dewaayu044@gmail.com')
    find('input[name="password"]').set('natalia09')
    find('input[type="submit"].button.-primary').click
  end
  
  Then('I should see an error message for invalid credentials') do
    expect(page).to have_content('KG Media ID atau password yang kamu masukkan salah') # Ubah sesuai dengan pesan error yang muncul
  end

  When('I attempt to log in with SQL Injection payload') do
    # Payload SQL Injection sederhana
    sql_payload = "' OR '1'='1"
    find('input[name="email"]').set(sql_payload)
    find('input[name="password"]').set(sql_payload)
    find('input[type="submit"].button.-primary').click
  end

  When('I attempt multiple invalid logins') do
    # Mensimulasikan beberapa upaya login yang salah
    invalid_attempts = [
      { email: 'invalid1@example.com', password: 'wrongpass1' },
      { email: 'invalid2@example.com', password: 'wrongpass2' },
      { email: 'invalid3@example.com', password: 'wrongpass3' }
    ]
    
    invalid_attempts.each do |attempt|
      find('input[name="email"]').set(attempt[:email])
      find('input[name="password"]').set(attempt[:password])
      find('input[type="submit"].button.-primary').click
    end
  end