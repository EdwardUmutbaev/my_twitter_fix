#Функционал: Отправка сообщений
#   Чтобы передать друзьям новости
#   Все авторизованные пользователи
#   Хотят создавать сообщения
  
#  Сценарий: Отправка сообщений
#    Допустим я ввожу сообщение
#    Если я нажимаю "Tweet"
#    То результатом должно быть созданное сообщение

Feature: Tweet
  In order to refer friends news  
  As a registered user
  They want to create messages 

 Scenario: Tweeting
  Given that I enter message 
  When I click on the "Tweet" 
  Then the result must be created message
