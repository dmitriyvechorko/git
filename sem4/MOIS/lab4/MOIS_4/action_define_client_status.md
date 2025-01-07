# Действие определения прямоугольника
Неатомарное действие для определения является ли входная структура прямоугольником.

Данное действие определяет статус клиента по его правам доступа. *(персональный менеджер, эксклюзивные предложения, премиум сервис, премиальный контент, участие в закрытых ивентах)*

**Имя класса действия:**
`action_define_client_status`

**Параметры:**

- `input_json` -- JSON-файл, содержащий информацию о клиенте;
- `rules_set` -- набор правил, для определения статуса клиента (логические формулы из ЛР3 и бинарные отношения из ЛР1);
- `result_structure` -- пустая структура, в которую в процессе выполнения действия будет записан статус клиента.

Действие разбивается на два других:
- действие трансляции JSON файла в стуктуру в sc-памяти
- действие определения статуса клиента

## Действие трансляции JSON файла в стуктуру в sc-памяти
Атомарное действие для трансляции JSON-файла в стуктуру в sc-памяти предназначено для построения структуры из файла, для дальнейшей ее обработки действием определения статуса клиента.

**Имя класса действия:**
`action_translate_into_memory`

**Параметры:**

- `input_json` -- JSON-файл, содержащий информацию о клиенте;
- `translation_result_structure` -- пустая структура в sc-памяти для записи рузльтата работы данного действия.

**Ход работы агента:**

- Агент генерирует узел входной структуры в базе знаний, идентифицирующий полученную ссылку на json файл как сообщение, а также пустую структуру как структуру для записи результата выполнения действия.
- Затем генерируется необходимая конструкция для вызова агента интерпретации. Пример этой конструкции показан ниже.
![action structure](MOIS_2.png)
- Агент выполняет трансляцию JSON-файла в структуру для записи результата выполнения действия.

### Пример

Пример входного JSON-файла:

``` json
{
  "client_info": {
    "client_id": "123456",
    "personal_info": {
      "name": "John Doe",
      "contact": {
        "email": "john.doe@example.com",
        "phone": "+1234567890"
      },
      "registration_date": "2023-01-01",
      "last_login_date": "2023-01-15"
    },
    "preferences": {
      "favorite_categories": ["electronics", "fashion"],
      "preferred_payment_method": "credit_card"
    },
    "access_rights": {
      "exclusive_offers": true,
      "premium_service": true,
      "closed_events_participation": false,
      "personal_manager": false,
      "premium_content_access": true
    }
  }
}

```

Пример протранслированного файла:

![translated json](<MOIS_1.png>)

### Результат

Возможные результаты:

- `SC_RESULT_OK` - JSON протранслирован успешно;
- `SC_RESULT_ERROR`- внутренняя ошибка.

## Действие определения статуса клиента'
Атомарное действие определения статуса клиента предназначено для определения статуса клиента, на основе логических формул и структуры, созданной в действии трансляции JSON-файла в структуру в sc-памяти.

**Имя класса действия:**
`action_set_client_status`

**Параметры:**

- `rules_set` -- набор правил, для определения статуса клиента (логические формулы из ЛР3);
- `translation_result_structure` -- структура в sc-памяти, в которой записан результат действия трансляции JSON-файла.

**Ход работы агента:**

- Агент определяет статус клиента с помощью логических формул по структуре, полученной из действие трансляции JSON файла.
- Затем генерируется необходимая конструкция для отображения результата. Пример этой конструкции показан ниже.
  ![alt text](output_result.png)

### Результат

Возможные результаты:

- `SC_RESULT_OK` - статус клиента определен;
- `SC_RESULT_ERROR`- внутренняя ошибка.