import ballerina/http;
import ballerina/oauth2;
import ballerina/test;

oauth2:OutboundOAuth2Provider outboundOAuth2Provider = new({
    tokenUrl: "https://localhost:9443/oauth2/token",
    clientId: "FlfJYKBD2c925h4lkycqNZlC2l4a",
    clientSecret: "PJz0UhTJMrHOo68QQNpvnqAY_3Aa",
    scopes: ["view-order"],
    clientConfig: {
        secureSocket: {
            trustStore: {
                path: "src/resources/wso2-truststore.p12",
                password: "wso2carbon"
            }
        }
    }
});
http:BearerAuthHandler outboundOAuth2Handler = new(outboundOAuth2Provider);

http:Client clientEP = new("https://localhost:9090", {
    auth: {
        authHandler: outboundOAuth2Handler
    },
    secureSocket: {
        trustStore: {
            path: "src/resources/ballerina-truststore.p12",
            password: "ballerina"
        }
    }
});

@test:Config {}
public function testOAuth2Success() {
    var response = clientEP->get("/orders/view");
    if (response is http:Response) {
        var result = response.getJsonPayload();
        test:assertTrue(result is json);
    } else {
        test:assertFail("Failed to call the endpoint.");
    }
}
