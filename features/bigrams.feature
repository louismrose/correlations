Scenario: Bigram dependencies
  Given the following bigram frequencies
        """
        448 of the
        241 in the
        152 Sir Henry
        """
  And the following unigram frequencies
      """
      3408 the
      1655 of
      929 in
      350 sir
      156 henry
      """
  When I calculate the dependencies
  Then the dependency of "of the" should be 3.99
  And  the dependency of "in the" should be 3.82
  And  the dependency of "Sir Henry" should be 139.77
