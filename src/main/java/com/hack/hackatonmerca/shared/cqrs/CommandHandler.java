package com.hack.hackatonmerca.shared.cqrs;

public interface CommandHandler<C extends Command> {
    void handle(C command);
}
