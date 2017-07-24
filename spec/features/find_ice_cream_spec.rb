require "json"
require "selenium-webdriver"
include RSpec::Expectations

RSpec.describe "FindIceCream" do

  before(:each) do
    @driver = Selenium::WebDriver.for :chrome
    @base_url = "http://localhost:3000/"
    @accept_next_alert = true
    @driver.manage.timeouts.implicit_wait = 30
    @verification_errors = []
  end
  
  after(:each) do
    @driver.quit
    @verification_errors == []
  end
  
  it "test_find_ice_cream" do
    @driver.get(@base_url + "/")
    (@driver.title) == "ToppingTargeter"
    verify { (@driver.find_element(:css, "h1").text) == "Toppings" }
    @driver.find_element(:link, "Show suggested ice creams for Sprinkles").click
    !60.times{ break if (@driver.find_element(:css, "h1").text == "Sprinkles" rescue false); sleep 1 }
    @driver.find_element(:link, "Return to Topping List").click
    !60.times{ break if (@driver.find_element(:xpath, "//h3[4]").text == "Dried Cranberries" rescue false); sleep 1 }
    @driver.find_element(:link, "Show suggested ice creams for Dried Cranberries").click
    !60.times{ break if (@driver.find_element(:css, "h3").text == "Suggested Ice Creams:" rescue false); sleep 1 }
    @driver.find_element(:link, "Return to Topping List").click
    @driver.navigate.back
    @driver.close
  end
  
  def element_present?(how, what)
    find_element(how, what)
    true
  rescue Selenium::WebDriver::Error::NoSuchElementError
    false
  end
  
  def alert_present?()
    switch_to.alert
    true
  rescue Selenium::WebDriver::Error::NoAlertPresentError
    false
  end
  
  def verify(&blk)
    yield
  rescue ExpectationNotMetError => ex
    @verification_errors << ex
  end
  
  def close_alert_and_get_its_text(how, what)
    alert = switch_to().alert()
    alert_text = alert.text
    if (@accept_next_alert) then
      alert.accept()
    else
      alert.dismiss()
    end
    alert_text
  ensure
    @accept_next_alert = true
  end
end
