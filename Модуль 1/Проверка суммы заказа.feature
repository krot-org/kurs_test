﻿#language: ru



Функционал: Проверка работы расчета суммы в документе "Заказ"

Как Менеджер по продажам я хочу
добавить документ заказ 
чтобы отразить намерение клиента о покупке в системе

Сценарий: Расчет суммы с строке нового заказа
*Создаение документа
	И В командном интерфейсе я выбираю 'Продажи' 'Заказы'
	Тогда открылось окно 'Заказы товаров'
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно 'Заказ (создание)'
*Заполнение шапки
	И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "1000 мелочей"'
	И из выпадающего списка с именем "Покупатель" я выбираю точное значение 'Магазин "Бытовая техника"'
	И из выпадающего списка с именем "Склад" я выбираю точное значение 'Склад отдела продаж'
*Работа с ТЧ
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" из выпадающего списка с именем "ТоварыТовар" я выбираю точное значение 'Хлеб'
	И я перехожу к следующему реквизиту
	И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '30,00'
	И я перехожу к следующему реквизиту
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '3'
	И я перехожу к следующему реквизиту
	И в таблице "Товары" я завершаю редактирование строки
	Когда открылось окно 'Заказ (создание) *'
	И я нажимаю на кнопку с именем 'ФормаЗаписать'
*Проверка заполенения ТЧ
	Тогда таблица "Товары" содержит строки:
		| 'Товар' | 'Цена'  | 'Количество' | 'Сумма' |
		| 'Хлеб'  | '30,00' | '3'          | '90,00' |
	
	
*Номер
	и я запоминаю значение поля 'Номер' как '$Номер$'
*Запись
	И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
//	И я жду закрытия окна 'Заказ * от *' в течение 20 секунд
*Проверка создания документ
	И таблица "Список" содержит строки:
	| 'Номер'  |
	| '$Номер$'|
