package com.deasla.geo;

import com.deasla.geo.model.GeoZone;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.web.server.LocalServerPort;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.web.reactive.server.WebTestClient;
import org.springframework.http.MediaType;
import java.util.List;

@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
public class GeoServiceApplicationTests {

    @LocalServerPort
    private int port;

    @Autowired
    private WebTestClient webTestClient;

    @Test
    void testCreateAndQueryZone() {
        GeoZone zone = new GeoZone(null, "Test Zone",
                List.of(List.of(0.0,0.0), List.of(1.0,0.0), List.of(1.0,1.0), List.of(0.0,1.0)));

        webTestClient.post().uri("/api/geo/zones")
                .contentType(MediaType.APPLICATION_JSON)
                .bodyValue(zone)
                .exchange()
                .expectStatus().isOk();

        webTestClient.get().uri("/api/geo/zones")
                .exchange()
                .expectStatus().isOk();
    }
}
