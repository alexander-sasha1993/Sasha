class Provider < ApplicationRecord

#Валидация
validates :name, :adress, :phone, :email, presence: true

#Сущность "Поставщик"
#связана с сущностью "Препараты" связью один ко многим
#один "Поставщик" может поставлять множество препаратов
has_many :preparats

end
