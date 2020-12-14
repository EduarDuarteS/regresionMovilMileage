import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

public class CountDefects {

    public static void main(String[] args) throws IOException {
        Path path = Paths.get("data.csv");
        long defects = Files.lines(path).skip(1)
                .map(s -> s.split(",")[1].trim())
                .filter(s -> Double.parseDouble(s) > 30.0)
                .peek(System.out::println)
                .count();
        long total = Files.lines(path).skip(1).count();

        System.out.println("Defects: " + defects + "/" + total);
    }

}