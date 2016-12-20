class Ordered < ApplicationRecord

#Валидация
validates :preparat_id, presence: true

#Данная таблица осуществляет связь многие-ко-многим
#между таблицами "Препараты" и "Заказы"
belongs_to :preparat
belongs_to :order

end
