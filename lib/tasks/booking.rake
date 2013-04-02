task :book do
 adult = 1
 child = 0
 country = "US"
 destination = "Hong Kong, (HKG)"
 buy_insurance = false
 depart_date = "20 Dec"
 return_date = "30 Dec"
 
 # Search
 browser = Watir::Browser.new :chrome
 browser.goto("http://www-uat.ete.cathaypacific.com/cx/en_#{country}.html?brand=CX") 
 browser.text_field(:id, 'city-from1').set("New York, (JFK)")
 # browser.text_field(:name, 'txtDateDepart-name').set(depart_date)
 # browser.text_field(:id, 'txtDateReturn').set(return_date)

 browser.text_field(:id, 'city-to1').set(destination)
 browser.select(:id, 'adult').select(adult)
 browser.select(:id, 'child').select(child)
 browser.button(:id, 'btnSearch').when_present.click
 
 #7x7
 browser.td(:class, "priceEffectOff").when_present.click
 browser.button(:name, 'Submit').when_present.click
 
 
 #Select Flight
 browser.button(:name, 'Submit').when_present.click
 sleep 3
 browser.button(:name, 'Submit').when_present.click
 
 #Fare Detail
 browser.button(:value, 'Book Flights').when_present.click
 
 #Passenger
 # Adult 1
 browser.select(:name, 'SELECT_TITLE_1').select('Mr')
 browser.text_field(:name, 'LAST_NAME_1').set('Last Name')
 browser.text_field(:name, 'FIRST_NAME_1').set('First Name')
 browser.text_field(:name, 'CONTACT_POINT_EMAIL_1').set('email@email.com')
 browser.select(:name, 'PHONE_COUNTRY').select('Hong Kong (+852)')
 browser.text_field(:name, 'PHONE_NUMBER').set('212312312')
 
 browser.select(:name, 'adtDateOfBirthDay1').select('03')
 browser.select(:name, 'adtDateOfBirthMonth1').select('11')
 browser.select(:name, 'adtDateOfBirthYear1').select('1955')
 
 browser.radio(:name, 'gender1').set
 
  # 
  # # Adult 2
  # browser.select(:name, 'SELECT_TITLE_2').select('Mr')
  # browser.text_field(:name, 'LAST_NAME_2').set('Last Name')
  # browser.text_field(:name, 'FIRST_NAME_2').set('First Name')
  # browser.text_field(:name, 'PHONE_NUMBER').set('212312312')
  # 
  # browser.select(:name, 'adtDateOfBirthDay2').select('03')
  # browser.select(:name, 'adtDateOfBirthMonth2').select('11')
  # browser.select(:name, 'adtDateOfBirthYear2').select('1955')
  # 
  # browser.radio(:name, 'gender2').set
  # 
  # # Adult 3
  # browser.select(:name, 'SELECT_TITLE_3').select('Mr')
  # browser.text_field(:name, 'LAST_NAME_3').set('Last Name')
  # browser.text_field(:name, 'FIRST_NAME_3').set('First Name')
  # browser.text_field(:name, 'PHONE_NUMBER').set('212312312')
  # 
  # browser.select(:name, 'adtDateOfBirthDay3').select('03')
  # browser.select(:name, 'adtDateOfBirthMonth3').select('11')
  # browser.select(:name, 'adtDateOfBirthYear3').select('1955')
  # 
  # browser.radio(:name, 'gender3').set
  # 
  # # Child 1
  # browser.select(:name, 'SELECT_TITLE_4').select('Miss')
  # browser.text_field(:name, 'LAST_NAME_4').set('Last Name')
  # browser.text_field(:name, 'FIRST_NAME_4').set('First Name') 
  # browser.select(:name, 'childDateOfBirthDay4').select('03')
  # browser.select(:name, 'childDateOfBirthMonth4').select('11')
  # browser.select(:name, 'childDateOfBirthYear4').select('2008')
  # 
  # browser.radio(:name, 'gender4').set
  # 
  # 
  # 
  # #Child 2
  # browser.select(:name, 'SELECT_TITLE_5').select('Miss')
  # browser.text_field(:name, 'LAST_NAME_5').set('Last Name')
  # browser.text_field(:name, 'FIRST_NAME_5').set('First Name')
  # browser.select(:name, 'childDateOfBirthDay5').select('03')
  # browser.select(:name, 'childDateOfBirthMonth5').select('11')
  # browser.select(:name, 'childDateOfBirthYear5').select('2008')
  # browser.radio(:name, 'gender5').set
  # 
  browser.button(:value, 'Continue to Payment').when_present.click
  browser.button(:value, 'Confirm').when_present.click
 
 #Payment
 if buy_insurance == true
   browser.radio(:name, 'INS2').when_present.click #Insurance
   browser.checkbox(:name, 'INSCHECKHCI').when_present.click
 end
  
 browser.radio(:value, 'VI').when_present.click
 browser.radio(:value, 'no').when_present.click 
 browser.text_field(:id, 'cardNumber').set('4548892024949787')
 browser.text_field(:name, 'CC_DIGIT').set('123')
 browser.text_field(:name, 'CC_NAME_ON_CARD').set('Passenger Name')
 browser.select(:name, 'CC_EXP_month').select('05')
 browser.select(:name, 'CC_EXP_year').select('2017')

 browser.text_field(:name, 'CC_ADDRESS1').set('Address Line 1')
 browser.text_field(:name, 'CC_ADDRESS2').set('Address Line 2')
 browser.text_field(:name, 'CC_CITY').set('Hong Kong')
 
 browser.checkbox(:name, 'AGREEMENT').when_present.click
 browser.screenshot.save "purchase.png"
 browser.button(:value, 'Purchase').when_present.click
 
 
 #Confirmation
 page = Nokogiri::HTML.parse(browser.html)
 pnr = page.at_css('h2').text.gsub('Booking Reference Number:','').strip
 browser.screenshot.save "confirmation_#{pnr}.png"
end