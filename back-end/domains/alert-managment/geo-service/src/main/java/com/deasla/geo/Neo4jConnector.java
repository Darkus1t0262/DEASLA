import org.neo4j.driver.AuthTokens;
import org.neo4j.driver.Driver;
import org.neo4j.driver.GraphDatabase;

public class Neo4jConnector {
    public static Driver connect() {
        String uri = "bolt://" + System.getenv("NEO4J_HOST") + ":" + System.getenv("NEO4J_PORT");
        String user = System.getenv("NEO4J_USER");
        String password = System.getenv("NEO4J_PASSWORD");

        return GraphDatabase.driver(uri, AuthTokens.basic(user, password));
    }
}
