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

# Add items to the cart to achieve a total value between $30-$60
total_value = 0
while total_value < 30 || total_value > 60
  price_element = browser.div(class: 'inventory_item_price')
  price_text = price_element.text
  price = price_text.gsub(/[^0-9.]/, '').to_f
  browser.button(class: 'btn_primary').click
  total_value += price
end

# Go to the shopping cart
browser.link(xpath: "//a[@class='shopping_cart_link']").click

# Proceed to checkout
browser.button(name: 'checkout').click

# Fill in the checkout information (you can add your details)
browser.text_field(id: 'first-name').set 'Surender'
browser.text_field(id: 'last-name').set 'Singh'
browser.text_field(id: 'postal-code').set '12345'
browser.button(name: 'continue').click

# Finish the order
browser.button(name: 'finish').click
puts "Total Value of the Order: #{total_value}"

# Close the browser
browser.close
