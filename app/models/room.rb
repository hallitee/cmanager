class Room < ApplicationRecord
has_many :requests

def options_name
"#{codename}"+"--"+"#{name}" +" -- "+" #{location}"+"--Capacity("+"#{capacity}"+")"

end
end
