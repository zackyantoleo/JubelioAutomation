require 'selenium-webdriver'

# URL login Jubelio
url = 'https://app.jubelio.com/login'

# Konfigurasi Selenium WebDriver
driver = Selenium::WebDriver.for :chrome
driver.manage.window.maximize

# Mengakses URL login
driver.navigate.to url

# Melakukan login ke akun Jubelio
email = 'qa.rakamin.jubelio@gmail.com'
password = 'Jubelio123!'
begin
  # Mencari elemen input email dan password
  wait = Selenium::WebDriver::Wait.new(timeout: 10)
  email_input = wait.until { driver.find_element(name: 'email') }
  password_input = wait.until { driver.find_element(name: 'password') }

  # Memasukkan email dan password
  email_input.send_keys(email)
  password_input.send_keys(password)
  password_input.send_keys(:return)

  # Menunggu hingga login selesai dan halaman utama Jubelio dimuat
  wait.until { driver.title.include?('Jubelio - Online Marketplace') }
  puts 'Login berhasil'

rescue
  puts 'Login gagal'
end

# Menutup browser
driver.quit
