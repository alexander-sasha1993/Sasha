class Manufacturer < ApplicationRecord

#Валидация
validates :name, :adress, :phone, :email, presence: true

#Сущность "Изготовите"
#связана с сущностью "Препараты" связью один ко многим
#один "Изготовитель" может изготавливать множество препаратов
has_many :preparats

end
