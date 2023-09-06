require 'watir'

# Initialize a Firefox browser instance
browser = Watir::Browser.new :firefox

# Open the website
browser.goto 'https://www.saucedemo.com'

# Find and fill in the username and password fields
browser.text_field(id: 'user-name').set 'standard_user'
browser.text_field(id: 'password').set 'secret_sauce'

# Click the Login button
browser.button(id: 'login-button').click

# Verify if the user is taken to the products page
if browser.url == 'https://www.saucedemo.com/inventory.html'
  puts 'Test 1: Login successful. User is on the products page.'
else
  puts 'Test 1: Login failed.'
end

# Close the browser
browser.close
