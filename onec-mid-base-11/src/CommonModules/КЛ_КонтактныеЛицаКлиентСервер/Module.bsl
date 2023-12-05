#Область ПрограммныйИнтерфейс
	// Процедура служит для добавления 
	// поля контактое лицо
	// в существующие документы
Процедура Дополнитьформу(Форма) Экспорт 
	
	ИмяФормы = Форма.ИмяФормы;
	
	Если ИмяФормы = "Документ.ЗаказПокупателя.Форма.ФормаДокумента" Тогда
		ДобавитьПолеКонтактноеЛицоВГруппуШапкаПраво(Форма);
	ИначеЕсли ИмяФормы = "Документ.ПоступлениеТоваровУслуг.Форма.ФормаДокумента" Тогда
		ДобавитьПолеКонтактноеЛицоВГруппуШапкаПраво(Форма);
	ИначеЕсли ИмяФормы = "Документ.РеализацияТоваровУслуг.Форма.ФормаДокумента" Тогда
		ДобавитьПолеКонтактноеЛицоВГруппуШапкаПраво(Форма);
	ИначеЕсли ИмяФормы = "Документ.ОплатаОтПокупателя.Форма.ФормаДокумента" Тогда
		ДобавитьПолеКонтактноеЛицоНаФормуПередСуммаДокумента(Форма);
	ИначеЕсли ИмяФормы = "Документ.ОплатаПоставщику.Форма.ФормаДокумента" Тогда
		ДобавитьПолеКонтактноеЛицоНаФормуПередСуммаДокумента(Форма);
	КонецЕсли;
	
КонецПроцедуры

#КонецОбласти	

#Область СлужебныеПроцедурыИФункции

Процедура ДобавитьПолеКонтактноеЛицоВГруппуШапкаПраво(Форма)
	
	ПолеВвода = Форма.Элементы.Добавить("КонтактноеЛицо", Тип("ПолеФормы"), Форма.Элементы.ГруппаШапкаПраво);
	ПолеВвода.Вид = ВидПоляФормы.ПолеВвода;
	ПолеВвода.ПутьКДанным = "Объект.КЛ_КонтактноеЛицо";
	
КонецПроцедуры

Процедура ДобавитьПолеКонтактноеЛицоНаФормуПередСуммаДокумента(Форма)
	ПолеВвода = Форма.Элементы.Вставить("КонтактноеЛицо", Тип("ПолеФормы"), , Форма.Элементы.Суммадокумента);
	ПолеВвода.Вид = ВидПоляФормы.ПолеВвода;
	ПолеВвода.ПутьКДанным = "Объект.КЛ_КонтактноеЛицо";
КонецПроцедуры

Процедура ПерерасчетТаблицТоварУслуга(Таблица, СогласованнаяСкидка) Экспорт 
	
	Для Каждого Строка Из Таблица Цикл 
		Скидка = Строка.Цена * Строка.Количество * (СогласованнаяСкидка / 100);
		Строка.Сумма = Строка.Цена * Строка.Количество - Скидка;
	КонецЦикла;
	
КонецПроцедуры

#КонецОбласти