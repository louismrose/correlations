Scenario: Each word must occur at least 300 times individually
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
  When I calculate the correlations with threshold 300
  Then the correlation of "of the" should be 1.38
  And  the correlation of "in the" should be 1.34
  And  the correlation of "Sir Henry" should be 0