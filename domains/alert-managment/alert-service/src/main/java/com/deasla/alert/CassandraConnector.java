import com.datastax.oss.driver.api.core.CqlSession;
import java.net.InetSocketAddress;

public class CassandraConnector {
    public static CqlSession connect() {
        String host = System.getenv("CASSANDRA_HOST");
        int port = Integer.parseInt(System.getenv("CASSANDRA_PORT"));
        String user = System.getenv("CASSANDRA_USER");
        String password = System.getenv("CASSANDRA_PASSWORD");
        String keyspace = System.getenv("CASSANDRA_KEYSPACE");

        return CqlSession.builder()
                .addContactPoint(new InetSocketAddress(host, port))
                .withAuthCredentials(user, password)
                .withKeyspace(keyspace)
                .withLocalDatacenter("datacenter1") // Default; check your Cassandra config
                .build();
    }
}
