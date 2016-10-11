﻿# encoding: utf-8
# language: ru

@ExportScenarios

Функционал: Создание склада
	Как Разработчик
	Хочу создавать склады
	Чтобы повторно использовать фичу в других сценариях

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий
	
Сценарий: Создан Склад с наименованием "Центральный склад" 
	Когда Отсутствует элемент справочника "Склады" с наименованием "Центральный склад"
	И     В панели разделов я выбираю "НСИ и администрирование"
	И     В панели функций я выбираю "Склады и магазины"
	Тогда открылось окно "Склады и магазины"
	И     я нажимаю на кнопку "Создать"
	Тогда открылось окно "Склад (создание)"
	И     в поле "Наименование" я ввожу текст "Центральный склад"
	И     я нажимаю на кнопку "Записать и закрыть"

