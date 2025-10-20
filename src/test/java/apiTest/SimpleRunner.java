package apiTest;

import com.intuit.karate.junit5.Karate;

public class SimpleRunner {
    @Karate.Test
    Karate SimpleTest() {
        return Karate.run("classpath:apiTest/pets").tags("@get_sold");
    }
}
