Given('I am logged in') do
    # Arahkan ke halaman login
    visit('https://account.kompas.com/login/')  # Ubah URL sesuai dengan halaman login
  
    # Mengisi form login
    find('input[name="email"]').set('dewaayu0445@gmail.com')
    find('input[name="password"]').set('natalia08')
    find('input[type="submit"].button.-primary').click 
    
    # Pastikan login berhasil (misalnya dengan memastikan URL atau elemen tertentu muncul)
    expect(page).to have_current_path(/https:\/\/www\.kompas\.com\//, url: true)
  end

  Given('I am on an article page') do
    visit('https://nasional.kompas.com/komentar/2024/12/01/18400231/pdi-p-klaim-menang-pilkada-2024-di-14-provinsi-mendominasi-di-papua') 
  end
  
  When('I click on the comment icon') do
    # Menemukan ikon komentar dan mengkliknya
    comment_icon = find('span.icon.icon-comment', wait: 5)
    comment_icon.click
  end
  
  Then('I should be redirected to the comment page') do
    # Memastikan halaman berpindah ke halaman komentar dengan URL yang sesuai
    expect(page).to have_current_path(/komentar/, url: true)
  end
  
  When('I write a comment {string}') do |comment|
    # Menemukan textarea untuk komentar dan mengisi komentar
    textarea = find('textarea#mainForm_comment', wait: 5)
    textarea.fill_in with: comment
  end
  
  When('I click the send button') do
    # Menemukan dan mengklik tombol kirim komentar
    send_button = find('button.comment__button.send', wait: 5)
    send_button.click
  end
  
  Then('my comment should be displayed on the article') do
    # Memastikan komentar berhasil ditampilkan setelah kirim
    expect(page).to have_css('div.commentItem')
  end

  When('I write a comment with special characters {string}') do |special_comment|
    # Menemukan textarea untuk komentar dan mengisi komentar dengan karakter khusus
    textarea = find('textarea#mainForm_comment', wait: 5)
    textarea.fill_in with: special_comment
  end
  
  Then('my comment with special characters should be displayed on the article') do
    # Memastikan komentar dengan karakter khusus berhasil ditampilkan setelah dikirim
    expect(page).to have_css('div.commentItem')
  end