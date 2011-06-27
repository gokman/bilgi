package com.joshlong.userregistrationexample.jobs.impl;

import com.joshlong.userregistrationexample.jobs.util.EmailUtils;
import com.joshlong.userregistrationexample.model.User;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.Logger;

/**
 * @author Josh Long
 */
public class SendWelcomeEmailJob extends AbstractEmailJob {
    private static Logger log = Logger.getLogger(SendConfirmationEmailJob.class);

    public void executeJob(Date timeOfBatchRun) throws Throwable {

        Long taskInstanceId = getWorkflowService().lockNextTaskInstanceByActor("send-welcome-email-actor");
        if (taskInstanceId != null) {

            // get the process instance
            long processInstance = getWorkflowService().getProcessInstanceIdForTaskInstance(taskInstanceId);

            // then we get the user id
            Long userId = (Long) getWorkflowService().getProcessVariable(processInstance, "userId");
            log.info ( "SendWelcomeEmailJob userId:" + userId) ;

            User user = getUserManagmentService().getUserById(userId);

            if (user != null) {

                // then we send them a nice email message

                String email = user.getEmail();

                EmailUtils emailUtils = (EmailUtils) getApplicationContext().getBean("emailUtils");

                Map<String, String> tpl = loadTemplate("welcome_email");
                Map<String, Object> parameters = new HashMap<String, Object>();
                parameters.put("user", user);
                parameters.put("userIdHash", getUserManagmentService().getHashForUser(user.getId()));

                emailUtils.sendEmailMessage("theteam@theteam.com", new String[]{email}, tpl.get("subject"), tpl.get(TXT_KEY), tpl.get(HTML_KEY), parameters);

                getWorkflowService().completeTaskInstance(taskInstanceId);

            }

        }

    }
}
