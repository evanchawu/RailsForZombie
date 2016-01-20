require "rails_helper"

RSpec.describe ZombieMailer, type: :mailer do
  describe "decomp_change" do
    let(:mail) { ZombieMailer.decomp_change }

    it "renders the headers" do
      expect(mail.subject).to eq("Decomp change")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

  describe "lost_brain" do
    let(:mail) { ZombieMailer.lost_brain }

    it "renders the headers" do
      expect(mail.subject).to eq("Lost brain")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
