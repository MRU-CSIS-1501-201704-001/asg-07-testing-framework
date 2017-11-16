Feature: Assignment 07, Scoring sets

    Scenario: Player 1 wins easy
        Given I am scoring a set
        Given player 1 wins a game easily
        Given player 1 wins a game easily
        Given player 1 wins a game easily
        Given player 1 wins a game easily
        Given player 1 wins a game easily
        Given player 1 wins a game easily
        When I run the Tennis Scoring Challenge
        Then there should not be an error message
        Then the "set" scores should be:
            """
            1-0
            2-0
            3-0
            4-0
            5-0
            6-0
            """
        Then there should be no more scores
        Then the program should say that player 1 won the "set"

    Scenario: Player 2 wins easy
        Given I am scoring a set
        Given player 2 wins a game easily
        Given player 2 wins a game easily
        Given player 2 wins a game easily
        Given player 2 wins a game easily
        Given player 2 wins a game easily
        Given player 2 wins a game easily
        When I run the Tennis Scoring Challenge
        Then there should not be an error message
        Then the "set" scores should be:
            """
            0-1
            0-2
            0-3
            0-4
            0-5
            0-6
            """
        Then there should be no more scores
        Then the program should say that player 2 won the "set"

    Scenario: Player 1 wins close (no overtime)
        Given I am scoring a set
        Given player 1 wins a game close
        Given player 2 wins a game close
        Given player 1 wins a game close
        Given player 2 wins a game close
        Given player 1 wins a game close
        Given player 2 wins a game close
        Given player 1 wins a game close
        Given player 2 wins a game close
        Given player 1 wins a game close
        Given player 2 wins a game close
        Given player 1 wins a game close
        Given player 1 wins a game close
        When I run the Tennis Scoring Challenge
        Then there should not be an error message
        Then the "set" scores should be:
            """
            1-0
            1-1
            2-1
            2-2
            3-2
            3-3
            4-3
            4-4
            5-4
            5-5
            6-5
            7-5
            """
        Then there should be no more scores
        Then the program should say that player 1 won the "set"

    Scenario: Player 1 wins close (no overtime)
        Given I am scoring a set
        Given player 2 wins a game close
        Given player 1 wins a game close
        Given player 2 wins a game close
        Given player 1 wins a game close
        Given player 2 wins a game close
        Given player 1 wins a game close
        Given player 2 wins a game close
        Given player 1 wins a game close
        Given player 2 wins a game close
        Given player 1 wins a game close
        Given player 2 wins a game close
        Given player 2 wins a game close
        When I run the Tennis Scoring Challenge
        Then there should not be an error message
        Then the "set" scores should be:
            """
            0-1
            1-1
            1-2
            2-2
            2-3
            3-3
            3-4
            4-4
            4-5
            5-5
            5-6
            5-7
            """
        Then there should be no more scores
        Then the program should say that player 2 won the "set"

    Scenario: Player 1 wins in overtime
        Given I am scoring a set
        Given player 2 wins a game close
        Given player 1 wins a game easily
        Given player 2 wins a game easily
        Given player 1 wins a game close
        Given player 2 wins a game easily
        Given player 1 wins a game easily
        Given player 2 wins a game close
        Given player 1 wins a game easily
        Given player 2 wins a game close
        Given player 1 wins a game easily
        Given player 2 wins a game close
        Given player 1 wins a game easily
        Given the points are "2,2,2,2,2,1,1,1,1,1,1,1"
        When I run the Tennis Scoring Challenge
        Then there should not be an error message
        Then the "set" scores should be:
            """
            0-1
            1-1
            1-2
            2-2
            2-3
            3-3
            3-4
            4-4
            4-5
            5-5
            5-6
            6-6
            7-6
            """
        Then there should be no more scores
        Then the program should say that player 1 won the "set"

    Scenario: Player 2 wins in overtime
        Given I am scoring a set
        Given player 2 wins a game easily
        Given player 1 wins a game easily
        Given player 2 wins a game easily
        Given player 1 wins a game easily
        Given player 2 wins a game easily
        Given player 1 wins a game easily
        Given player 2 wins a game easily
        Given player 1 wins a game close
        Given player 2 wins a game close
        Given player 1 wins a game close
        Given player 2 wins a game close
        Given player 1 wins a game close
        Given the points are "1,1,1,1,1,1,2,2,2,2,2,2,2,2"
        When I run the Tennis Scoring Challenge
        Then there should not be an error message
        Then the "set" scores should be:
            """
            0-1
            1-1
            1-2
            2-2
            2-3
            3-3
            3-4
            4-4
            4-5
            5-5
            5-6
            6-6
            6-7
            """
        Then there should be no more scores
        Then the program should say that player 2 won the "set"

