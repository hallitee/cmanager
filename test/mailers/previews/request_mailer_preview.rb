# Preview all emails at http://localhost:3000/rails/mailers/request_mailer
class RequestMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/request_mailer/newreq
  def newreq
    @req = Request.last
    RequestMailer.newreq(@req)
  end
  def projectormail
    @req = Request.last
    RequestMailer.projectormail(@req)
  end
    def refreshmentmail
    @req = Request.last
    RequestMailer.refreshmentmail(@req, @f, @con)
  end
  # Preview this email at http://localhost:3000/rails/mailers/request_mailer/approved
  def approved
    @req = Request.last
    RequestMailer.approved(@req)
  end

  # Preview this email at http://localhost:3000/rails/mailers/request_mailer/rejected
  def rejected
    RequestMailer.rejected
  end

  # Preview this email at http://localhost:3000/rails/mailers/request_mailer/reschedule
  def reschedule
    @req = Request.last
    RequestMailer.reschedule(@req)
  end

  # Preview this email at http://localhost:3000/rails/mailers/request_mailer/reminder
  def reminder
    RequestMailer.reminder
  end

end
