package com.joshlong.userregistrationexample.jobs;

import com.joshlong.userregistrationexample.UserManagmentService;
import com.joshlong.userregistrationexample.workflow.WorkflowService;
import org.apache.commons.lang.exception.ExceptionUtils;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;

import java.util.Date;

/**
 * This class is meant to be subclassed by individual jobs that need attention.
 * For example, any emails that need to get sent should subclass this.
 */
abstract public class AbstractJob implements ApplicationContextAware {

    private ApplicationContext applicationContext;

    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        this.applicationContext = applicationContext;
    }

    public ApplicationContext getApplicationContext() {
        return applicationContext;
    }

    private WorkflowService workflowService;
    private UserManagmentService userManagmentService;

    public WorkflowService getWorkflowService() {
        return workflowService;
    }

    public void setWorkflowService(WorkflowService workflowService) {
        this.workflowService = workflowService;
    }

    public UserManagmentService getUserManagmentService() {
        return userManagmentService;
    }

    public void setUserManagmentService(UserManagmentService userManagmentService) {
        this.userManagmentService = userManagmentService;
    }

    public void executeInternal() throws Throwable {
        Date now = new Date();

        for (int i = 0; i < executions; i++) {
            try {

                if (isShouldContinue())
                    executeJob(now);

            } catch (Throwable thro) {
                System.out.println(ExceptionUtils.getFullStackTrace(thro));
            }
        }
    }

    public void resetExecutionContext() {
        this.executions = 1;
        this.shouldContinue = true;
    }

    private boolean shouldContinue = true;
    private int executions = 1;

    public int getExecutions() {
        return executions;
    }

    public void setExecutions(int executions) {
        this.executions = executions;
    }

    synchronized public boolean isShouldContinue() {
        return shouldContinue;
    }

    synchronized public void setShouldContinue(boolean shouldContinue) {
        this.shouldContinue = shouldContinue;
    }

    abstract public void executeJob(Date timeOfBatchRun) throws Throwable;
}
