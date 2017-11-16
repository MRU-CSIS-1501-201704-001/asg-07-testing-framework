Feature: Assignment 07, Scoring matches

    Scenario: Player 1 wins easy
        Given I am scoring a match
        Given player 1 wins a set easily
        Given player 1 wins a set easily
        When I run the Tennis Scoring Challenge
        Then there should not be an error message
        Then the "match" scores should be:
            """
            1-0
            2-0
            """
        Then there should be no more scores
        Then the program should say that player 1 won the "match"

    Scenario: Player 2 wins easy
        Given I am scoring a match
        Given player 2 wins a set easily
        Given player 2 wins a set easily
        When I run the Tennis Scoring Challenge
        Then there should not be an error message
        Then the "match" scores should be:
            """
            0-1
            0-2
            """
        Then there should be no more scores
        Then the program should say that player 2 won the "match"

    Scenario: Player 2 wins a nailbiter
        Given I am scoring a match
        Given player 2 wins a set in overtime
        Given player 1 wins a set in overtime
        Given player 2 wins a set in overtime
        When I run the Tennis Scoring Challenge
        Then there should not be an error message
        Then the "match" scores should be:
            """
            0-1
            1-1
            1-2
            """
        Then there should be no more scores
        Then the program should say that player 2 won the "match"

    Scenario: Player 1 wins a comeback
        Given I am scoring a match
        Given player 2 wins a set easily
        Given player 1 wins a set in overtime
        Given player 1 wins a set in overtime
        When I run the Tennis Scoring Challenge
        Then there should not be an error message
        Then the "match" scores should be:
            """
            0-1
            1-1
            2-1
            """
        Then there should be no more scores
        Then the program should say that player 1 won the "match"

