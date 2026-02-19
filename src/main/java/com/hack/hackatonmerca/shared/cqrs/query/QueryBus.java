package com.hack.hackatonmerca.shared.cqrs.query;

import com.hack.hackatonmerca.shared.cqrs.Query;
import com.hack.hackatonmerca.shared.cqrs.QueryHandler;
import org.springframework.stereotype.Component;

import java.lang.reflect.ParameterizedType;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Component
public class QueryBus {
    private final Map<Class<?>, QueryHandler<?, ?>> handlers = new HashMap<>();

    public QueryBus(List<QueryHandler<?, ?>> discovered) {
        for (QueryHandler<?, ?> h : discovered) {
            var type = Arrays.stream(h.getClass().getGenericInterfaces())
                    .filter(t -> t instanceof ParameterizedType && ((ParameterizedType) t).getRawType().equals(QueryHandler.class))
                    .map(t -> (Class<?>) ((ParameterizedType) t).getActualTypeArguments()[0])
                    .findFirst().orElseThrow();
            handlers.put(type, h);
        }
    }

    @SuppressWarnings("unchecked")
    public <R, Q extends Query<R>> R ask(Q query) {
        var h = (QueryHandler<Q, R>) handlers.get(query.getClass());
        if (h == null) throw new IllegalStateException("No handler para " + query.getClass());
        return h.handle(query);
    }
}