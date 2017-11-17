package step_definitions;

import static org.junit.Assert.*;
import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.contentOf;

import java.io.ByteArrayOutputStream;
import java.io.ByteArrayInputStream;
import java.io.PrintStream;
import java.io.File;
import java.util.Arrays;
import java.util.Queue;
import java.util.LinkedList;
import java.util.regex.Matcher;

import cucumber.api.java.en.*;
import cucumber.api.java.Before;
import cucumber.api.java.After;
import cucumber.api.Scenario;
import cucumber.api.PendingException;

import java.util.regex.Pattern;


public class TennisScoringChallengeSteps {

    private LinkedList<String> inputQueue = new LinkedList<>();
    private String[] outputLines;
    private int nextLine;

    private static final double TOLERANCE = 0.001;

    @Before
    public void beforeCallingScenario() {
    }

    @After
    public void afterRunningScenario(Scenario scenario) {
        this.inputQueue.clear();
        this.outputLines = null;
        this.nextLine = -1;
    }

    public void provideKeyboardInput() {
        String queuedInput = "";
        for (String s : inputQueue) {
            queuedInput += String.format("%s%n",s);
        }
        System.setIn(new ByteArrayInputStream(queuedInput.getBytes()));
    }

    @Given("^I am scoring a game$")
    public void iAmScoringAGame() throws Throwable {
        inputQueue.offer("g");
    }

    @Given("^I am scoring an overtime game$")
    public void iAmScoringAnOvertimeGame() throws Throwable {
        inputQueue.offer("o");
    }

    @Given("^I am scoring a set$")
    public void iAmScoringASet() throws Throwable {
        inputQueue.offer("s");
    }

    @Given("^I am scoring a match$")
    public void iAmScoringAMatch() throws Throwable {
        inputQueue.offer("m");
    }

    @Given("^the input \"([^\"]*)\"$")
    public void theInput(String input) throws Throwable {
        inputQueue.offer(input);
    }

    @Given("^the points are \"([^\"]*)\"$")
    public void thePointsAre(String pointSequence) throws Throwable {
        String[] points = pointSequence.split(",");
        for (String point : points) {
            inputQueue.offer(point);
        }
    }

    @Given("^player (\\d+) wins a game easily$")
    public void playerWinsAGameEasily(int player) throws Throwable {
        for (int i = 0; i < 4; i++) {
            inputQueue.offer(Integer.toString(player));
        }
    }

    @Given("^player (\\d+) wins a game close$")
    public void playerWinsAGameClose(int player) throws Throwable {
        int otherPlayer = player == 1 ? 2 : 1;
        for (int i = 0; i < 4; i++) {
            inputQueue.offer(Integer.toString(player));
            inputQueue.offer(Integer.toString(otherPlayer));
        }
        inputQueue.offer(Integer.toString(player));
        inputQueue.offer(Integer.toString(player));
    }

    @Given("^player (\\d+) wins a set easily$")
    public void playerWinsASetEasily(int player) throws Throwable {
        playerWinsAGameEasily(player);
        playerWinsAGameEasily(player);
        playerWinsAGameEasily(player);
        playerWinsAGameEasily(player);
        playerWinsAGameEasily(player);
        playerWinsAGameEasily(player);
    }

    @Given("^player (\\d+) wins a set in overtime$")
    public void playerWinsASetInOvertime(int player) throws Throwable {
        int otherPlayer = player == 1 ? 2 : 1;
        playerWinsAGameClose(player);
        playerWinsAGameClose(otherPlayer);
        playerWinsAGameClose(player);
        playerWinsAGameClose(otherPlayer);
        playerWinsAGameClose(player);
        playerWinsAGameClose(otherPlayer);
        playerWinsAGameClose(player);
        playerWinsAGameClose(otherPlayer);
        playerWinsAGameClose(player);
        playerWinsAGameClose(otherPlayer);
        playerWinsAGameClose(player);
        playerWinsAGameClose(otherPlayer);
        thePointsAre("1,2,1,2,1,2,1,2,1,2,1,2");
        thePointsAre(player + "," + player);
    }

    @When("^I run the Tennis Scoring Challenge$")
    public void iRunTheTennisScoringChallenge() throws Throwable {
        ByteArrayOutputStream outContent = null;
        PrintStream testSystemOut = null;
        try {
            outContent = new ByteArrayOutputStream();
            testSystemOut = new PrintStream(outContent, true, "UTF-8");

            PrintStream originalSystemOut = System.out;
            try {
                System.setOut(testSystemOut);

                provideKeyboardInput();
                Class.forName("ProblemSetMain").getMethod("runTennisChallenge").invoke(null);
            } finally {
                System.setOut(originalSystemOut);
            }

            testSystemOut.flush();
            outputLines = outContent.toString("UTF-8").split("\\R+");
            nextLine = 0;
        } finally {
            testSystemOut.close();
            outContent.close();
        }
    }

    @Then("^the scores should be:$")
    public void theScoresShouldBe(String expectedScores) throws Throwable {
        String[] scores = expectedScores.split("\n");
        for (String score : scores) {
            assertRemainingOutputContainsLine(score);
        }
    }

    @Then("^the \"([^\"]*)\" scores should be:$")
    public void theScoresShouldBe(String whatAreWeScoring, String expectedScores) throws Throwable {
        String[] scores = expectedScores.split("\n");
        for (String score : scores) {
            String scoreRegex = "(?i)" + "^[^\\d]*" + whatAreWeScoring + ".*" + score + "[^\\d]*$";
            String scoreDescription = "a " + whatAreWeScoring + " score of \"" + score + "\" (type first and no other numbers in the line)";
            assertRemainingOutputContains(scoreRegex, scoreDescription);
        }
    }

    @Then("^there should be no more scores$")
    public void thereShouldBeNoMoreScores() throws Throwable {
        assertRemainingOutputMissingWord("score");
    }

    @Then("^there should be an error message$")
    public void thereShouldBeAnErrorMessage() throws Throwable {
        String errorRegex = "(?i)(not |not a |in)(valid|correct|good)|error|bad";
        String errorDescription = "message that contains '*valid', '*good', '*correct', 'error' or 'bad'";
        assertRemainingOutputContains(errorRegex, errorDescription);
    }

    @Then("^there should be (\\d+) error messages$")
    public void thereShouldBeErrorMessages(int errorCount) throws Throwable {
        for (int i = 0; i < errorCount; i++) {
            thereShouldBeAnErrorMessage();
        }
    }

    @Then("^there should not be an error message$")
    public void thereShouldNotBeAnErrorMessage() throws Throwable {
        String errorRegex = "(?i)(not |not a |in)(valid|correct|good)|error|bad";
        String errorDescription = "message that contains '*valid', '*good', '*correct', 'error' or 'bad'";
        assertRemainingOutputMissing(errorRegex, errorDescription);
    }

    @Then("^the program should say that player (\\d+) won the \"([^\"]*)\"$")
    public void theProgramShouldSayThatPlayerWonThe(int playerWhoWon, String thingTheyWon) throws Throwable {
        String winTypeFirst = "^[^\\d]*" + thingTheyWon + "[^\\d]+" + playerWhoWon + "[^\\d]*$";
        String winTypeSecond = "^[^\\d]*" + playerWhoWon + "[^\\d]+" + thingTheyWon + "[^\\d]*$";
        String winRegex = "(?i)" + winTypeFirst + "|" + winTypeSecond;
        String winDescription = "message that player " + playerWhoWon + " won a \"" + thingTheyWon + "\" (with no other numbers in the line)";
        assertRemainingOutputContains(winRegex, winDescription);
    }



    public void assertRemainingOutputIsEmpty() throws Throwable {
        if (this.nextLine != this.outputLines.length) {
            throw new AssertionError("Expected no output, but there was output.");
        }
    }


    public void assertEntireOutputIsExactly(String expectedOutput) throws Throwable {
        String[] expectedChunked = expectedOutput.split("\\R+");
        int expectedOutputLength = expectedChunked.length;
        int actualOutputLength = outputLines.length;

        if (actualOutputLength != expectedOutputLength) {
            throw new AssertionError("Expected output to be " + expectedOutputLength + " lines long, but it was " + actualOutputLength + " lines instead.");
        }

        for (int i = 0; i < expectedOutputLength; i++) {
            String expectedLine = expectedChunked[i];
            String actualLine = outputLines[i];
            if (!actualLine.equals(expectedLine)) {
                String msg = String.format("%nLine %02d is %n%s%n but expected %n%s%n", i, actualLine, expectedLine);
                throw new AssertionError(msg);
            }
        }
    }

    public void assertRemainingOutputContainsFragment(String word) throws Throwable {
        String regexSafeWord = word.replaceAll("[-.\\+*?\\[^\\]$(){}=!<>|:\\\\]", "\\\\$0");
        this.assertRemainingOutputContains(regexSafeWord, "\"" + word + "\"");
    }

    public void assertRemainingOutputContainsLine(String line) throws Throwable {
        String regexSafeLine = line.replaceAll("[-.\\+*?\\[^\\]$(){}=!<>|:\\\\]", "\\\\$0");
        this.assertRemainingOutputContains("^" + regexSafeLine + "$", "exactly \"" + line + "\" on a line by itself");
    }

    public void assertRemainingOutputContainsWord(String word) throws Throwable {
        String regexSafeWord = word.replaceAll("[-.\\+*?\\[^\\]$(){}=!<>|:\\\\]", "\\\\$0");
        this.assertRemainingOutputContains("\\b" + regexSafeWord + "\\b", "word \"" + word + "\"");
    }

    public void assertRemainingOutputContains(String regex, String niceName) throws Throwable {
        int lineToCheck = this.nextLine;
        boolean found = false;

        while (!found && lineToCheck < this.outputLines.length) {
            Pattern p = Pattern.compile(regex);
            Matcher m = p.matcher(this.outputLines[lineToCheck]);
            found = m.find();

            lineToCheck++;
        }

        if (found) {
            this.nextLine = lineToCheck;
        } else {
            throw new AssertionError("Could not find " + niceName + " in remaining lines:\n" +
                String.join("\n", Arrays.copyOfRange(this.outputLines, this.nextLine, this.outputLines.length)) +
                (this.nextLine > 0 ? "\nPrevious line was:\n" + this.outputLines[this.nextLine - 1] : ""));
        }
    }

    public void assertRemainingOutputMissingWord(String word) throws Throwable {
        String regexSafeWord = word.replaceAll("[-.\\+*?\\[^\\]$(){}=!<>|:\\\\]", "\\\\$0");
        this.assertRemainingOutputMissing("\\b" + regexSafeWord + "\\b", word);
    }

    public void assertRemainingOutputMissing(String regex, String niceName) throws Throwable {
        int lineToCheck = this.nextLine;
        boolean found = false;

        while (!found && lineToCheck < this.outputLines.length) {
            Pattern p = Pattern.compile(regex);
            Matcher m = p.matcher(this.outputLines[lineToCheck]);
            found = m.find();

            lineToCheck++;
        }

        if (found) {
            throw new AssertionError("Did not expect to find '" + regex + "', but found it in the line:\n" +
                String.join("\n", this.outputLines[lineToCheck - 1]));
        }
    }

}
