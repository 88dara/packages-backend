package com.oyo.packagesbackend.config;

import org.apache.thrift.transport.THttpClient;

public class ThriftClient<T1> {

    THttpClient tHttpClient;
    T1 thriftClient;

    public ThriftClient(THttpClient tHttpClient, T1 thriftClient) {
        this.tHttpClient = tHttpClient;
        this.thriftClient = thriftClient;
    }

    public THttpClient getHttpClient() {
        return tHttpClient;
    }

    public T1 getThriftClient() {
        return thriftClient;
    }
}
