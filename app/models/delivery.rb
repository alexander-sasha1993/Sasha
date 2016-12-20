class Delivery < ApplicationRecord

#Валидация
validates :name, :phone, presence: true

#Сущность "Доставка"
#связана с сущностью "Заказы" связью один ко многим
#одина "Доставка" может использоваться много раз в заказах
has_many :orders

end
