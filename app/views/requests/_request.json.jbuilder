json.extract! request, :id, :title, :date, :startd, :endd, :desc, :requestby, :email, :reschedule, :projector, :refreshment, :special, :attendees, :status, :approval, :final, :remarks, :created_at, :updated_at
json.url request_url(request, format: :json)
