class Client < ApplicationRecord

#Валидация
validates :name, :adress, :phone, presence: true

#Сущность "Клиент"
#связана с сущностью "Заказы" связью один ко многим
#один "Клиент" может делать много заказов
has_many :orders

end
