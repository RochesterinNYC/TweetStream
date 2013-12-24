Feature: Users can search Twitter data

  Scenario: User searches by hashtag
    When I search for #Rails
    Then my twitter approval matrix should be brilliant highbrow

  # Scenario: User filters search by location
  #   When I search for NYC
  #   And I set my location to Los Angeles, CA
  #   Then all of my search results should be within 50 miles of LA

