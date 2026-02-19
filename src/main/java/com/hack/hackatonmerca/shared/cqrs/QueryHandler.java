package com.hack.hackatonmerca.shared.cqrs;

public interface QueryHandler<Q extends Query<R>, R> {
    R handle(Q query);
}