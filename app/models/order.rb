class Order < ApplicationRecord

#Валидация
validates :datepublic, :dateperformance, :costdelivery, :client_id, :delivery_id, :employee_id, presence: true

#Сущность "Заказы"
#связана с сущностями (таблицами справочниками) "Клиент", "Доставка", "Сотрудник"
belongs_to :client
belongs_to :delivery
belongs_to :employee

#Таблица заказы связана с таблицей "Препараты" связьм многие-ко-многим
#через таблицу "Заказано"
has_many :ordereds, :dependent => :destroy # уничтожать вместе с основным экземпляром
has_many :preparats, through: :ordereds

accepts_nested_attributes_for :ordereds, :allow_destroy => true

end
