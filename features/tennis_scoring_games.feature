Feature: Assignment 07, Scoring games

    Scenario: Player 1 wins easy
        Given I am scoring a game
        Given the points are "1,1,1,1"
        When I run the Tennis Scoring Challenge
        Then there should not be an error message
        Then the "game" scores should be:
            """
            1-0
            2-0
            3-0
            4-0
            """
        Then there should be no more scores
        Then the program should say that player 1 won the "game"

    Scenario: Player 2 wins easy
        Given I am scoring a game
        Given the points are "2,2,2,2"
        When I run the Tennis Scoring Challenge
        Then there should not be an error message
        Then the "game" scores should be:
            """
            0-1
            0-2
            0-3
            0-4
            """
        Then there should be no more scores
        Then the program should say that player 2 won the "game"

    Scenario: Player 1 wins close
        Given I am scoring a game
        Given the points are "1,2,1,2,1,2,1,2,1,2,1,1"
        When I run the Tennis Scoring Challenge
        Then there should not be an error message
        Then the "game" scores should be:
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
        Then the program should say that player 1 won the "game"

    Scenario: Player 2 wins close
        Given I am scoring a game
        Given the points are "1,2,1,2,1,2,1,2,1,2,1,2,2,2"
        When I run the Tennis Scoring Challenge
        Then there should not be an error message
        Then the "game" scores should be:
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
            6-6
            6-7
            6-8
            """
        Then there should be no more scores
        Then the program should say that player 2 won the "game"

    Scenario: Player 1 wins see-saw
        Given I am scoring a game
        Given the points are "1,1,1,2,2,2,2,1,2,1,1,1"
        When I run the Tennis Scoring Challenge
        Then there should not be an error message
        Then the "game" scores should be:
            """
            1-0
            2-0
            3-0
            3-1
            3-2
            3-3
            3-4
            4-4
            4-5
            5-5
            6-5
            7-5
            """
        Then there should be no more scores
        Then the program should say that player 1 won the "game"
