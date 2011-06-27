package com.joshlong.userregistrationexample.jobs;

import java.util.HashMap;
import java.util.Map;

/**
 * @author Josh Long
 */
public class TaskInstanceContext {

    public TaskInstanceContext(String actorId, Long taskInstanceId, Map<String, Object> attributes) {
        this.actorId = actorId;
        this.taskInstanceId = taskInstanceId;
        this.attributes = attributes;
    }

    private String actorId;
    private Long taskInstanceId;
    private Map<String, Object> attributes = new HashMap<String, Object>();

    public String getActorId() {
        return actorId;
    }

    public void setActorId(String actorId) {
        this.actorId = actorId;
    }

    public Long getTaskInstanceId() {
        return taskInstanceId;
    }

    public void setTaskInstanceId(Long taskInstanceId) {
        this.taskInstanceId = taskInstanceId;
    }

    public Map<String, Object> getAttributes() {
        return attributes;
    }

    public void setAttributes(Map<String, Object> attributes) {
        this.attributes = attributes;
    }
}
