class Employee < ApplicationRecord

#Валидация
validates :family, :adress, :phone, :description, :position_id, presence: true

#Сущность "Сотрудник"
#связана с сущностью "Заказы" связью один ко многим
#один "Сотрудник" может оформлять много заказов
has_many :orders


#Сущность "Сотрудник"
#связана с сущностью (таблицей справочником) "Должность сотрудника"
belongs_to :position

end
