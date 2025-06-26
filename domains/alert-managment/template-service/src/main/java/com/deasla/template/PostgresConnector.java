import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class PostgresConnector {
    public static Connection connect() throws SQLException {
        String host = System.getenv("POSTGRES_HOST");
        String port = System.getenv("POSTGRES_PORT");
        String db = System.getenv("POSTGRES_DB");
        String user = System.getenv("POSTGRES_USER");
        String password = System.getenv("POSTGRES_PASSWORD");

        String url = "jdbc:postgresql://" + host + ":" + port + "/" + db;
        return DriverManager.getConnection(url, user, password);
    }
}
