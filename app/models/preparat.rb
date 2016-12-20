class Preparat < ApplicationRecord

#Валидация
validates :name, :cost, :dateofmanufacturer, :shelflife, :manufacturer_id, :type_id, :provider_id, presence: true

#Сущность "Препараты"
#связана с сущностями (таблицами справочниками) "Изготовитель", "Тип", "Поставщик"
belongs_to :manufacturer
belongs_to :type
belongs_to :provider

#Таблица препараты связана с таблицей "Заказы" связьм многие-ко-многим
#через таблицу "Заказано"
has_many :ordereds, :dependent => :destroy # уничтожать вместе с основным экземпляром
has_many :orders, through: :ordereds

end
