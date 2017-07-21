class RequestMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.request_mailer.newreq.subject
  #
  def newreq(req)

 @req = req
    @greeting = "Hi"
       @room = Room.where("id=?", @req.room_id).first
    mail to: "#{@req.email}", subject: "New Booking Received"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.request_mailer.approved.subject
  #
  def approved(req)
@req = req
@greeting = "Hi"
b = @req.startd.to_s.split(" ")
@startd = b[1]
c = @req.endd.to_s.split(" ")
@endd = c[1]
mail to: "#{@req.email}", subject: "Conference Room Booking Approved"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.request_mailer.rejected.subject
  #
  def rejected(req)
@req = req
@greeting = "Hi"
b = @req.startd.to_s.split(" ")
@startd = b[1]
c = @req.endd.to_s.split(" ")
@endd = c[1]
mail to: "#{@req.email}", subject: "Conference Room Booking Rejected"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.request_mailer.reschedule.subject
  #
  def reschedule(req)
@req = req
@greeting = "Hi"
b = @req.startd.to_s.split(" ")
@startd = b[1]
c = @req.endd.to_s.split(" ")
@endd = c[1]
mail to: "#{@req.email}", subject: "Conference Room Booking Rescheduled"
  end


  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.request_mailer.reminder.subject
  #
  def reminder(req)
@req = req
@greeting = "Hi"
b = @req.startd.to_s.split(" ")
@startd = b[1]
c = @req.endd.to_s.split(" ")
@endd = c[1]
mail to: "#{@req.email}", subject: "Conference Room Booking Rescheduled"
  end
end
