package com.oyo.packagesbackend.config;

import com.oyo.search.TSearchService;
import org.apache.thrift.protocol.TJSONProtocol;
import org.apache.thrift.protocol.TProtocol;
import org.apache.thrift.transport.THttpClient;
import org.apache.thrift.transport.TTransportException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class SearchConfig {

    private static final Logger logger = LoggerFactory.getLogger(SearchConfig.class);

    private static int port = 5000;
    private static String host = "localhost";
    private static String uri = "search/";

    @Bean
    public TSearchService.Client commClientBuilder() throws Exception{
        return getCommClient().getThriftClient();
    }

    public ThriftClient<TSearchService.Client> getCommClient() {

        logger.debug("Opening a new search service connection");

        THttpClient httpClient = null;
        try {

//            httpClient = new THttpClient("http://" + host  + "/" + uri);
        httpClient = new THttpClient("http://" + host + ":" + port + "/" + uri);

            httpClient.setConnectTimeout(3000);

        } catch (TTransportException e) {
            logger.error("Search service client exception : Transport exception " + e.getMessage());
        }

        TProtocol protocol = new TJSONProtocol(httpClient);
        return new ThriftClient<>(httpClient, new TSearchService.Client(protocol));
    }

    public void closeConnection(ThriftClient thriftClient) {
        thriftClient.getHttpClient().close();
        logger.debug("Search service connection successfully closed");
    }
}
