Feature: Assignment 07, Scoring with bad input

    Scenario: An invalid scoring type is selected (character)
        Given the input "b"
        When I run the Tennis Scoring Challenge
        Then there should be an error message
        Then there should be no more scores

    Scenario: An invalid scoring type is selected (number)
        Given the input "640"
        When I run the Tennis Scoring Challenge
        Then there should be an error message
        Then there should not be an error message
        Then there should be no more scores

    Scenario: Player 1 wins a game with bad input
        Given I am scoring a game
        Given the points are "1,12,1,Zwei,1,Dos,1"
        When I run the Tennis Scoring Challenge
        Then there should be 3 error messages
        Then there should not be an error message
        Then the program should say that player 1 won the "game"
        Then there should be no more scores

    Scenario: Player 1 wins a game with bad input
        Given I am scoring a game
        Given the points are "2,9,2,Eins,2,Uno,2"
        When I run the Tennis Scoring Challenge
        Then there should be 3 error messages
        Then there should not be an error message
        Then the program should say that player 2 won the "game"
        Then there should be no more scores

    Scenario: Player 1 wins an overtime game with bad input
        Given I am scoring an overtime game
        Given the points are "1,6,1,Zwei,1,Dos,1,Deux,1,II,1,Ni,1"
        When I run the Tennis Scoring Challenge
        Then there should be 6 error messages
        Then there should not be an error message
        Then the program should say that player 1 won the "game"
        Then there should be no more scores

    Scenario: Player 2 wins an overtime game with bad input
        Given I am scoring an overtime game
        Given the points are "2,-1,2,Eins,2,Uno,2,Un,2,I,2,Ichi,2"
        When I run the Tennis Scoring Challenge
        Then there should be 6 error messages
        Then there should not be an error message
        Then the program should say that player 2 won the "game"
        Then there should be no more scores

    Scenario: Player 2 wins a set with bad input
        Given I am scoring a set
        Given the points are "2,5,2,Eins,2,Uno,2"
        Given the points are "2,One,2,Eins,2,Uno,2"
        Given the points are "2,1,2,Eins,2,Uno,2"
        Given the points are "2,One,2,Eins,2,Uno,2"
        Given the points are "2,42,2,Eins,2,Uno,2"
        Given the points are "2,One,2,Eins,2,Uno,2"
        When I run the Tennis Scoring Challenge
        Then there should be 17 error messages
        Then there should not be an error message
        Then the program should say that player 2 won the "set"
        Then there should be no more scores

    Scenario: Player 1 wins an overtime set with bad input
        Given I am scoring a set
        Given the points are "1,Two,1,Zwei,1,Dos,1"
        Given the points are "2,One,2,Eins,2,Uno,2"
        Given the points are "1,-3,1,Zwei,1,Dos,1"
        Given the points are "2,One,2,Eins,2,Uno,2"
        Given the points are "1,-3,1,Zwei,1,Dos,1"
        Given the points are "2,One,2,Eins,2,Uno,2"
        Given the points are "1,-3,1,Zwei,1,Dos,1"
        Given the points are "2,One,2,Eins,2,Uno,2"
        Given the points are "1,-3,1,Zwei,1,Dos,1"
        Given the points are "2,One,2,Eins,2,Uno,2"
        Given the points are "1,-3,1,Zwei,1,Dos,1"
        Given the points are "2,One,2,Eins,2,Uno,2"
        Given the points are "1,Two,1,Zwei,1,Dos,1,Deux,1,II,1,Ni,1"
        When I run the Tennis Scoring Challenge
        Then there should be 42 error messages
        Then there should not be an error message
        Then the program should say that player 1 won the "set"
        Then there should be no more scores

    Scenario: Player 1 wins a match with bad input
        Given I am scoring a match
        Given the points are "1,Two,1,Zwei,1,Dos,1"
        Given the points are "1,8,1,Zwei,1,Dos,1"
        Given the points are "1,8,1,Zwei,1,Dos,1"
        Given the points are "1,8,1,Zwei,1,Dos,1"
        Given the points are "1,8,1,Zwei,1,Dos,1"
        Given the points are "1,Two,1,Zwei,1,Dos,1"
        Given the points are "2,One,2,Eins,2,Uno,2"
        Given the points are "2,12,2,Eins,2,Uno,2"
        Given the points are "2,12,2,Eins,2,Uno,2"
        Given the points are "2,12,2,Eins,2,Uno,2"
        Given the points are "2,12,2,Eins,2,Uno,2"
        Given the points are "2,12,2,Eins,2,Uno,2"
        Given the points are "1,Two,1,Zwei,1,Dos,1"
        Given the points are "1,Two,1,Zwei,1,Dos,1"
        Given the points are "1,6,1,Zwei,1,Dos,1"
        Given the points are "1,Two,1,Zwei,1,Dos,1"
        Given the points are "1,72,1,Zwei,1,Dos,1"
        Given the points are "1,Two,1,Zwei,1,Dos,1"
        When I run the Tennis Scoring Challenge
        Then there should be 54 error messages
        Then there should not be an error message
        Then the program should say that player 1 won the "match"
        Then there should be no more scores
