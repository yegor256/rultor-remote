Feature: Command Line Processing
  As an owner of a repository I want to have an
  ability to encrypt my files

  Scenario: Simple encrypting
    Given I have a "credentials" file with content:
    """
    some secret
    """
    When I run bin/rultor with "encrypt -p test/test credentials"
    Then Exit code is zero
    And Stdout contains "credentials.asc"
