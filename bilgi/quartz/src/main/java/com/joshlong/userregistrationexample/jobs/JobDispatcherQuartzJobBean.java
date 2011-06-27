package com.joshlong.userregistrationexample.jobs;

import org.apache.commons.lang.exception.ExceptionUtils;
import org.quartz.*;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.scheduling.quartz.QuartzJobBean;

/**
 * this bean is what we actually schedule using Quartz.
 * This bean runs every minute. We don't let it overlap, hence 'Stateful'
 */
public class JobDispatcherQuartzJobBean extends QuartzJobBean implements StatefulJob {

    /**
     * This will get you immediate satisfaction -- knowing that the job infrastructure itself is all workign.
     *
     * @param args
     * @throws Throwable
     */
    public static void main(String[] args) throws Throwable {
        ApplicationContext context = new ClassPathXmlApplicationContext("jobs.xml");
        JobDispatcherQuartzJobBean job = new JobDispatcherQuartzJobBean();
        job.execute(context);
    }

    public void execute(ApplicationContext appContext) throws Throwable {
        for (String beanName : appContext.getBeanDefinitionNames()) {
            if (beanName.toLowerCase().endsWith("job") && !beanName.toLowerCase().equalsIgnoreCase("abstractJob")) {
                Object beanHavingJobInName = appContext.getBean(beanName);
                if (beanHavingJobInName instanceof AbstractJob) {

                    System.out.println("Retreived job '" + beanName + "'.");

                    AbstractJob job = (AbstractJob) beanHavingJobInName;
                    job.resetExecutionContext();
                    job.executeInternal();
                    job.resetExecutionContext();

                    Thread.sleep(1000);

                }
            }
        }

    }

    protected void executeInternal(JobExecutionContext jobExecutionContext) throws JobExecutionException {
        try {

            Scheduler scheduler = jobExecutionContext.getScheduler();
            SchedulerContext context = scheduler.getContext();
            ApplicationContext appContext = (ApplicationContext) context.get("applicationContext");

            execute(appContext);

        } catch (Throwable thro) {
            System.out.println(ExceptionUtils.getFullStackTrace(thro));
        }

    }
}
