class Position < ApplicationRecord

#Валидация
validates :name, presence: true


#Сущность "Должность сотрудника"
#связана с сущностью "Сотрудник" связью один ко многим
#одина "Должность" может относиться ко многим сотрудникам
has_many :employees

end
