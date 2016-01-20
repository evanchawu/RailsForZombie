class ZombieMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.zombie_mailer.decomp_change.subject
  #
  def decomp_change(zombie)
    @greeting = "Hi"
    @zombie = zombie
    @last_tweet = @zombie.tweets.last

    attachments['z.pdf'] = File.read("#{Rails.root}/public/zombie.pdf")
    mail to: @zombie.email, subject: "your decomp stage has change"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.zombie_mailer.lost_brain.subject
  #
  def lost_brain
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
