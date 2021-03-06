﻿# encoding: utf-8
# language: ru

Функционал: Ведомость по товарам организаций

Как Менеджер по закупкам
Я хочу получать список остатка товара
Чтобы анализировать необходимость пополнения склада

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: отчет Ведомость по товарам организаций

	Когда Создан документ поступления
	И     В панели разделов я выбираю "Финансовый результат и контроллинг"
	И     В панели функций я выбираю "Отчеты по финансовому результату"
	Тогда открылось окно "Отчеты по финансовому результату"
	И     я нажимаю на гиперссылку "Ведомость по товарам организаций"
	Тогда открылось окно "Ведомость по товарам организаций"
	И     в поле "ЗначениеПараметраНастроек_Начало_9342d6d0f0be4138b6f6ccb76debddcd" я ввожу текст "01.09.2016"
	И     я перехожу к следующему реквизиту
	И     в поле "ЗначениеПараметраНастроек_Окончание_9342d6d0f0be4138b6f6ccb76debddcd" я ввожу текст "30.10.2016"
	И     я перехожу к следующему реквизиту
	И     я нажимаю на кнопку "Сформировать"
	И     Пауза 10
	Тогда табличный документ формы с именем "ОтчетТабличныйДокумент" стал равен:
		| 'Ведомость по товарам организаций'  | ''                                                   | ''         | ''                  | ''                 | ''       | ''                 |
		| ''                                  | ''                                                   | ''         | ''                  | ''                 | ''       | ''                 |
		| 'Параметры:'                        | 'Период: 01.09.2016 - 30.10.2016'                    | ''         | ''                  | ''                 | ''       | ''                 |
		| ''                                  | 'Учитывать передачи запасов других организаций: Нет' | ''         | ''                  | ''                 | ''       | ''                 |
		| ''                                  | ''                                                   | ''         | ''                  | ''                 | ''       | ''                 |
		| 'Организация'                       | 'Склад'                                              | ''         | 'Количество'        | ''                 | ''       | ''                 |
		| 'Артикул'                           | 'Номенклатура'                                       | 'Ед. изм.' | 'Начальный остаток' | 'Приход'           | 'Расход' | 'Конечный остаток' |
		| 'Мерседес'                          | 'Центральный склад'                                  | ''         | ''                  | '3,000'            | ''       | '3,000'            |
		| ''                                  | 'Генератор турбопривода'                             | 'шт'       | ''                  | '2,000'            | ''       | '2,000'            |
		| ''                                  | 'Турбодизель'                                        | 'шт'       | ''                  | '1,000'            | ''       | '1,000'            |
		| 'Итого'                             | ''                                                   | ''         | ''                  | '3,000'            | ''       | '3,000'            |
		| ''                                  | ''                                                   | ''         | ''                  | ''                 | ''       | ''                 |
		| 'Итого товаров в единицах хранения' | ''                                                   | ''         | ''                  | ''                 | ''       | ''                 |
		| ''                                  | ''                                                   | ''         | ''                  | ''                 | ''       | ''                 |
		| 'Ед. изм.'                          | 'Количество'                                         | ''         | ''                  | ''                 | ''       | ''                 |
		| ''                                  | 'Начальный остаток'                                  | 'Приход'   | 'Расход'            | 'Конечный остаток' | ''       | ''                 |
		| 'шт'                                | ''                                                   | '3,000'    | ''                  | '3,000'            | ''       | ''                 |
		| 'Итого'                             | ''                                                   | '3,000'    | ''                  | '3,000'            | ''       | ''                 |

	И     Я закрываю окно "Ведомость по товарам организаций"
	И Я закрываю сеанс TESTCLIENT
