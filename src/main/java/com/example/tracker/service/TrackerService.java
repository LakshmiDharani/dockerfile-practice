package com.example.tracker.service;

import com.example.tracker.model.Topic;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class TrackerService {
    private List<Topic> topics = new ArrayList<>();
    private String preparationTime = "Not set";

    public List<Topic> getTopics() {
        return topics;
    }

    public void addTopic(String name) {
        topics.add(new Topic(name, false));
    }

    public void markAsCovered(String name) {
        for (Topic topic : topics) {
            if (topic.getName().equalsIgnoreCase(name)) {
                topic.setCovered(true);
                break;
            }
        }
    }

    public String getPreparationTime() {
        return preparationTime;
    }

    public void setPreparationTime(String preparationTime) {
        this.preparationTime = preparationTime;
    }
}
