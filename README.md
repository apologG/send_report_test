# Тестовое задание

<img src="https://cdn.iconscout.com/icon/free/png-256/ruby-44-1175099.png" width="48" height="48"> 

Реализовать функционал для генерации отчета (report) из данных и отправки пользователю (host) на email.

### Формат данных
```Ruby
# type can be: 'confirmed', 'modified', 'cancelled'
[
  { code: 'A-001', guest: 'guest@email.com', entity: 'reservation', type: 'confirmed', created_at: '2019-06-08 23:06:45'},
  { code: 'A-001', guest: 'guest@email.com', entity: 'reservation', type: 'modified', created_at: '2019-06-08 23:40:02'}
]
```
### Генерация отчета и отправка сообщения

Сгенерированный отчет должен выглядеть следующим образом:
```Plain text
A-001. Guest: guest@email.com. Confirmed reservation at '2019-06-08 23:06:45'
A-001. Guest: guest@email.com. Modified reservation at '2019-06-08 23:40:02'
```
- можно добавить сортировку (по вашему усмотрению)

Будем считать что для отправки сообщения на email пользователю будет достаточно использовать следующий сервис (просто поместите его в ваш метод)
```Ruby
class Mailer
  #
  # Send report by email
  #
  # @param [String] from
  # @param [String] to
  # @param [String] subject
  # @param [String] report
  #
  # @return [Boolean]
  #
  def self.deliver(from:, to:, subject:, report:)
    # ...
  end
end

Mailer.deliver(
  from: 'system@email.com',
  to: 'host@email.com',
  subject: 'Report',
  body: report
)
```
- Предусмотрите расширяемость функционала - в будущем может потребоваться отправлять отчеты не только посредством email, но и например через telegram.
- Покройте свой код тестами. 

________________________________________

# Запуск приложения
Ruby version - 2.6.6\
Для того, чтобы установить необходимые гем запустить приложение, выполните следующие команды у себя в окне терминала:
```
git clone https://github.com/apologG/send_report.git 
bundle install
ruby main.rb
```
# Тесты
Выполните следующие команды у себя в окне терминала находяь в каталоге приложения:
```
rspec
```
