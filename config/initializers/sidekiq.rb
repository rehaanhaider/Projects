schedule_file = "config/schedule.yml"


Sidekiq::Cron::Job.create(name: 'CronWorker every min', cron: '* * * * *', class: 'WeeklyUpdateWorker') if Sidekiq.server?
