class Task < ApplicationRecord
    belongs_to :user

    after_create :schedule_reminders

    validates :name, presence: true
    validates :status, presence: true
    validates :deadline, presence: true

    private

    def schedule_reminders
        TaskReminderJob.set(wait_until: deadline - 1.day).perform_later(id)
        TaskReminderJob.set(wait_until: deadline - 1.hour).perform_later(id)
    end
end
