Feature: Assignment 07, Scoring games

    Scenario: Player 1 wins easy
        Given I am scoring a game
        Given the points are "1,1,1,1"
        When I run the Tennis Scoring Challenge
        Then there should not be an error message
        Then the program should say that player 1 won the "game"
        Then there should be no more scores

    Scenario: Player 2 wins easy
        Given I am scoring a game
        Given the points are "2,2,2,2"
        When I run the Tennis Scoring Challenge
        Then there should not be an error message
        Then the program should say that player 2 won the "game"
        Then there should be no more scores

    Scenario: Player 1 wins close
        Given I am scoring a game
        Given the points are "1,2,1,2,1,2,1,2,1,2,1,1"
        When I run the Tennis Scoring Challenge
        Then there should not be an error message
        Then the program should say that player 1 won the "game"
        Then there should be no more scores

    Scenario: Player 2 wins close
        Given I am scoring a game
        Given the points are "1,2,1,2,1,2,1,2,1,2,1,2,2,2"
        When I run the Tennis Scoring Challenge
        Then there should not be an error message
        Then the program should say that player 2 won the "game"
        Then there should be no more scores

    Scenario: Player 1 wins see-saw
        Given I am scoring a game
        Given the points are "1,1,1,2,2,2,2,1,2,1,1,1"
        When I run the Tennis Scoring Challenge
        Then there should not be an error message
        Then the program should say that player 1 won the "game"
        Then there should be no more scores
