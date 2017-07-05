class Room < ApplicationRecord
has_many :requests

def options_name
"#{name}" +" "+" #{location}"

end
end
