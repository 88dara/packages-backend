package com.oyo.packagesbackend.config;

import com.oyo.metadata.TMetaDataService;
import org.apache.thrift.protocol.TJSONProtocol;
import org.apache.thrift.protocol.TProtocol;
import org.apache.thrift.transport.THttpClient;
import org.apache.thrift.transport.TTransportException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class MetadataConfig {

    private static final Logger logger = LoggerFactory.getLogger(MetadataConfig.class);

    private static int port = 5000;
    private static String host = "localhost";
    private static String uri = "metadata/";

    @Bean
    public TMetaDataService.Client commClientBuilder() throws Exception{
        return getCommClient().getThriftClient();
    }

    public ThriftClient<TMetaDataService.Client> getCommClient() {

        logger.debug("Opening a new metadata service connection");

        THttpClient httpClient = null;
        try {

//            httpClient = new THttpClient("http://" + host  + "/" + uri);
        httpClient = new THttpClient("http://" + host + ":" + port + "/" + uri);

            httpClient.setConnectTimeout(3000);

        } catch (TTransportException e) {
            logger.error("Metadata service client exception : Transport exception " + e.getMessage());
        }

        TProtocol protocol = new TJSONProtocol(httpClient);
        return new ThriftClient<>(httpClient, new TMetaDataService.Client(protocol));
    }

    public void closeConnection(ThriftClient thriftClient) {
        thriftClient.getHttpClient().close();
        logger.debug("Metadata service connection successfully closed");
    }
}
