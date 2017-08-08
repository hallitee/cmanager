class Room < ApplicationRecord
has_many :requests

def options_name
"#{codename}"+"--"+"#{company}"+"  "+"#{name}" +" -- "+" #{location}"+"--Capacity("+"#{capacity}"+")"

end
end
