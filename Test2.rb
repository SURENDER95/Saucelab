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

# Add items to the cart
3.times do |i|
  browser.buttons(class: 'btn_inventory')[i].click
end

# Go to the shopping cart
browser.link(xpath: "//a[@class='shopping_cart_link']").click

# Validate that there are 3 items in the cart
cart_item_count = browser.elements(class: 'cart_item').count
if cart_item_count == 3
  puts 'Items successfully added to the cart.'
else
  puts 'Failed to add items to the cart.'
end

# Remove 1 item from the cart
browser.button(id: 'remove-sauce-labs-backpack').click


# Proceed to checkout
browser.button(id: 'checkout').click

# Fill in the checkout information
browser.text_field(id: 'first-name').set('John')
browser.text_field(id: 'last-name').set('Doe')
browser.text_field(id: 'postal-code').set('12345')

# Continue to the next step
browser.button(id: 'continue').click

# Finish the purchase
browser.button(id: 'finish').click

# Validate that the purchase is complete
if browser.url.include?('checkout-complete.html')
  puts 'Purchase completed successfully.'
else
  puts 'Purchase failed.'
end

# Close the browser
browser.close
