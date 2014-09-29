Feature: Help Banner
  As an owner of a repository I want to have an
  ability to read help

  Scenario: Help can be printed
    When I run bin/rultor with "-v"
    Then Exit code is zero
    And Stdout contains "1.0.snapshot"
