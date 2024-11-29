package com.mm.webstn.component;

import com.mm.shared.domain.Message;
import lombok.Getter;
import org.springframework.jms.annotation.JmsListener;
import org.springframework.stereotype.Component;

import java.util.ArrayList;

@Component
public class MessageConsumer {

    private final String QUEUE = "scanner.queue";

    @Getter
    private ArrayList<String> receivedMessages= new ArrayList();

    @JmsListener(destination = QUEUE)
    public void receiveMessage(Message message) {
       System.out.println("Received message: "+message.getText());
        receivedMessages.add(message.getText());
    }

}
