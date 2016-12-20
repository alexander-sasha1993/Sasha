class Type < ApplicationRecord

#Валидация
validates :typeform, presence: true

#Сущность "Тип"
#связана с сущностью "Препараты" связью один ко многим
#один "Тип" может может относиться к многим препаратам
has_many :preparats

end
