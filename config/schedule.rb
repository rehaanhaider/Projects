set :output, "log/cron.log"

WeeklyUpdateWorker:
    cron: "* * * * *"
    class: "WeeklyUpdateWorker"