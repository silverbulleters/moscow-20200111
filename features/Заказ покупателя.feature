#language: ru
@tree
@Ignore

Функционал: Заказ товара для покупателя

Как менеджер по продажам
Я хочу заказывать товары у поставщика
Чтобы уменьшить себестоимость

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Подготовка первоначальных данных для теста
	Дано и я готовлю данные

Сценарий: Оптовый заказ
# Сценарий: Заказ единичного товара
# Сценарий: Заказ без предоплаты
# Сценарий: Заказ с предоплатой

	# Дано я создаю номенклатуру "Товар1" с кратностью 10
	Когда я создаю заказ покупателя
		Когда В панели разделов я выбираю 'Интегрируемые подсистемы'
		И Я нажимаю кнопку командного интерфейса 'Демо: Счета на оплату покупателям'
		Тогда открылось окно 'Демо: Счета на оплату покупателям'
		И я нажимаю на кнопку с именем 'ФормаСоздать'
	И я заполняю шапку документа
		Когда открылось окно 'Демо: Счет на оплату покупателю (создание)'
		И я нажимаю кнопку выбора у поля "Организация"
		Тогда открылось окно 'Демо: Организации'
		И в таблице "Список" я перехожу к строке:
			| Код       | Наименование         |
			| 000000001 | Новые технологии ООО |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Демо: Счет на оплату покупателю (создание) *'
		И я нажимаю кнопку выбора у поля "Партнер"
		Тогда открылось окно 'Демо: Партнеры'
		И в таблице "Список" я перехожу к строке:
			| Наименование                 |
			| 'Торговый дом "Комплексный"' |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Демо: Счет на оплату покупателю (создание) *'
		И я нажимаю кнопку выбора у поля "Контрагент"
		Тогда открылось окно 'Демо: Контрагенты'
		И в таблице "Список" я перехожу к строке:
			| Наименование                 |
			| 'Торговый дом "Комплексный"' |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Демо: Счет на оплату покупателю (создание) *'
		И из выпадающего списка "Договор" я выбираю точное значение 'Договор ТД Комплексный с Новые технологии'
		И я нажимаю кнопку выбора у поля "Договор"
		Тогда открылось окно 'Демо: Договоры контрагентов'
		И я нажимаю на кнопку 'Список'
		И в таблице "Список" я перехожу к строке:
			| Валюта расчетов | Дата договора | Наименование                              | Номер договора |
			| RUB             | '1/23/2015'     | Договор ТД Комплексный с Новые технологии | 374            |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Демо: Счет на оплату покупателю (создание) *'
		И я нажимаю кнопку выбора у поля "Подразделение"
		Тогда открылось окно 'Демо: Подразделения'
		И в таблице "Список" я перехожу к строке:
			| Код       | Наименование |
			| 000000001 | Отдел продаж |
		И в таблице "Список" я выбираю текущую строку
	# И я заполняю таблицу товаров двумя позициями товаров с количеством 1000 штук
	И я провожу документ
		Когда открылось окно 'Демо: Счет на оплату покупателю (создание) *'
		И я нажимаю на кнопку 'Провести'
	# Тогда я вижу, что в отчете "Заказы покупателей" есть мой документ
	Тогда формируется печатная форма "Заказ покупателю"
		
		Тогда открылось окно 'Демо: Счет на оплату покупателю * от *'
		И я нажимаю на кнопку 'Счет на оплату'
		Тогда открылось окно 'Печать документа'
		И в табличном документе 'ТекущаяПечатнаяФорма' я перехожу к ячейке "R9C2:R10C19"
	И результаты совпадают с ожиданием
		Тогда элемент формы с именем "Копий" стал равен '1'
		# И     элемент формы с именем "КартинкаИнформации" стал равен 'Картинка информации'
		# И     элемент формы с именем "ДополнительнаяИнформация" стал равен 'ДополнительнаяИнформация'
		И Табличный документ "ТекущаяПечатнаяФорма" равен макету "Макеты/Счет на оплату" по шаблону