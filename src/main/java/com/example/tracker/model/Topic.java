package com.example.tracker.model;

public class Topic {
    private String name;
    private boolean isCovered;

    public Topic(String name, boolean isCovered) {
        this.name = name;
        this.isCovered = isCovered;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public boolean isCovered() {
        return isCovered;
    }

    public void setCovered(boolean covered) {
        isCovered = covered;
    }
}
