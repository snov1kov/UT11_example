﻿# encoding: utf-8
# language: ru

@ExportScenarios

Функционал: Создание организации
	Как Разработчик
	Хочу создавать организации
	Чтобы повторно использовать фичу в других сценариях

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий
	
Сценарий: Создание элемента справочника Организация с наименованием "Мерседес" 
	Когда Отсутствует элемент справочника "Организации" с наименованием "Мерседес"
	И	  В панели разделов я выбираю "НСИ и администрирование"
	И     В панели функций я выбираю "Организации"
	Тогда открылось окно "Организации"
	И     я нажимаю на кнопку "Юридическое лицо"
	Тогда открылось окно "Организация (создание)"
	И     в поле "Сокращенное наименование" я ввожу текст "Мерседес"
	И     я нажимаю на кнопку "Записать и закрыть"
	И     я перехожу к закладке "Учетная политика"
	И     я нажимаю на кнопку с именем "СоздатьНовуюУчетнуюПолитику"
	Тогда открылось окно "Учетная политика организации (создание)"
	И     в поле "Наименование" я ввожу текст "Основная"
	И     я перехожу к закладке "НДС"
	И     я перехожу к закладке "Запасы"
	И     я нажимаю на кнопку "Записать и закрыть"
	Тогда открылось окно "Организация (создание) *"
	И     я нажимаю на кнопку "Записать и закрыть"

