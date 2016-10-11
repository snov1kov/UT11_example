﻿//начало текста модуля

#Область Служебные_функции_и_процедуры

&НаКлиенте
// контекст фреймворка Vanessa-Behavior
Перем Ванесса;
 
&НаКлиенте
// Структура, в которой хранится состояние сценария между выполнением шагов. Очищается перед выполнением каждого сценария.
Перем Контекст Экспорт;
 
&НаКлиенте
// Структура, в которой можно хранить служебные данные между запусками сценариев. Существует, пока открыта форма Vanessa-Behavior.
Перем КонтекстСохраняемый Экспорт;

&НаКлиенте
// Функция экспортирует список шагов, которые реализованы в данной внешней обработке.
Функция ПолучитьСписокТестов(КонтекстФреймворкаBDD) Экспорт
	Ванесса = КонтекстФреймворкаBDD;
	
	ВсеТесты = Новый Массив;

	//описание параметров
	//Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,Снипет,ИмяПроцедуры,ПредставлениеТеста,Транзакция,Параметр);

	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ОтсутствуетЭлементСправочникаСНаименованием(Парам01,Парам02)","ОтсутствуетЭлементСправочникаСНаименованием","Когда Отсутствует элемент справочника ""Организации"" с наименованием ""Мерседес""");

	Возврат ВсеТесты;
КонецФункции
	
&НаСервере
// Служебная функция.
Функция ПолучитьМакетСервер(ИмяМакета)
	ОбъектСервер = РеквизитФормыВЗначение("Объект");
	Возврат ОбъектСервер.ПолучитьМакет(ИмяМакета);
КонецФункции
	
&НаКлиенте
// Служебная функция для подключения библиотеки создания fixtures.
Функция ПолучитьМакетОбработки(ИмяМакета) Экспорт
	Возврат ПолучитьМакетСервер(ИмяМакета);
КонецФункции

#КонецОбласти



#Область Работа_со_сценариями

&НаКлиенте
// Процедура выполняется перед началом каждого сценария
Процедура ПередНачаломСценария() Экспорт
	
КонецПроцедуры

&НаКлиенте
// Процедура выполняется перед окончанием каждого сценария
Процедура ПередОкончаниемСценария() Экспорт
	
КонецПроцедуры

#КонецОбласти


///////////////////////////////////////////////////
//Реализация шагов
///////////////////////////////////////////////////

&НаКлиенте
//И Отсутствует элемент справочника "Организация" с наименованием "Мерседес"
//@ОтсутствуетЭлементСправочникаСНаименованием(Парам01,Парам02)
Процедура ОтсутствуетЭлементСправочникаСНаименованием(ТипСправочника,Наименование) Экспорт
	
	ОтсутствуетЭлементСправочникаСНаименованиемНаСервере(ТипСправочника,Наименование);
	
КонецПроцедуры

Процедура ОтсутствуетЭлементСправочникаСНаименованиемНаСервере(ТипСправочника,Наименование) Экспорт
	
	Запрос = Новый Запрос;
	Запрос.Текст = 
		"ВЫБРАТЬ
		|	Организации.Ссылка
		|ИЗ
		|	Справочник."+ТипСправочника+" КАК Организации
		|ГДЕ
		|	Организации.Наименование = &Наименование";
	
	Запрос.УстановитьПараметр("Наименование", Наименование);
	
	РезультатЗапроса = Запрос.Выполнить();
	
	ВыборкаДетальныеЗаписи = РезультатЗапроса.Выбрать();
	
	Пока ВыборкаДетальныеЗаписи.Следующий() Цикл
		
		ОрганизацияСсылка = ВыборкаДетальныеЗаписи.Ссылка;
		ОрганизацияОбъект = ОрганизацияСсылка.ПолучитьОбъект();
		ОрганизацияОбъект.Удалить();
		
	КонецЦикла;
	
	
КонецПроцедуры


//окончание текста модуля
