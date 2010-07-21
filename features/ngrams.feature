Scenario: Bigram correlations
  Given the following n-gram frequencies
        """
        448 of the
        241 in the
        152 Sir Henry
        """
  And the following word frequencies
      """
      3408 the
      1655 of
      929 in
      350 sir
      156 henry
      """
  When I calculate the correlations
  Then the correlation of "of the" should be 3.99
  And  the correlation of "in the" should be 3.82
  And  the correlation of "Sir Henry" should be 139.77
  
Scenario: Trigram correlations
    Given the following n-gram frequencies
          """
          44 upon the moor
          27 that it was
          22 Sir Henry Baskerville
          """
    And the following word frequencies
        """
        3408 the
        1154 that
        1031 it
        803 was
        350 sir
        314 upon
        163 moor
        156 henry
        114 baskerville
        """
    When I calculate the correlations
    Then the correlation of "upon the moor" should be 0.91
    And  the correlation of "that it was" should be 0.73
    And  the correlation of "Sir Henry Baskerville" should be 2.86

