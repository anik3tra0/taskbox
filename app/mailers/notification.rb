class Notification < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification.notify_completed.subject
  #
  def notify_completed(task)
    @task = task
    mail to: "#{task.project.client.email}", subject: "#{task.name} completed"
  end
end
