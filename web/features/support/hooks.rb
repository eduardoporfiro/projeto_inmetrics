After do |scenario|
  if scenario.failed?
    scenario_name = scenario.name.gsub /[^\w\-]/, ' '
    time = Time.now.strftime("%Y-%m-%d %H%M")
    path = "reports/#{time + ' - ' + scenario_name}.png"
    driver = Capybara.current_session.driver
    driver.save_screenshot(path)
    Allure.add_attachment(
      name: "#{time + ' - ' + scenario_name}.png",
      source: File.open(path),
      type: Allure::ContentType::PNG,
      test_case: true
    )
  end
end