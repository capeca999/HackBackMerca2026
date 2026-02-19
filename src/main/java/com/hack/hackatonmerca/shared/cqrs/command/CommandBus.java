package com.hack.hackatonmerca.shared.cqrs.command;

import com.hack.hackatonmerca.shared.cqrs.Command;
import com.hack.hackatonmerca.shared.cqrs.CommandHandler;
import org.springframework.stereotype.Component;

import java.lang.reflect.ParameterizedType;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Component
public class CommandBus {
    private final Map<Class<?>, CommandHandler<?>> handlers = new HashMap<>();

    public CommandBus(List<CommandHandler<?>> discovered) {
        for (CommandHandler<?> h : discovered) {
            var type = Arrays.stream(h.getClass().getGenericInterfaces())
                    .filter(t -> t instanceof ParameterizedType && ((ParameterizedType) t).getRawType().equals(CommandHandler.class))
                    .map(t -> (Class<?>) ((ParameterizedType) t).getActualTypeArguments()[0])
                    .findFirst().orElseThrow();
            handlers.put(type, h);
        }
    }

    @SuppressWarnings("unchecked")
    public <C extends Command> void dispatch(C command) {
        var h = (CommandHandler<C>) handlers.get(command.getClass());
        if (h == null) throw new IllegalStateException("No handler para " + command.getClass());
        h.handle(command);
    }
}
