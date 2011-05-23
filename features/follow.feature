#Функционал: Слежение
#   Чтобы получать новости интересующие людей
#   Все авторизованные пользователи
#   Хотят добавлять их в свой список

#  Сценарий: Слежение за пользователем
#    Допустим я на странице интересующего пользователя
#    Если я нажимаю "Follow"
#    То этот пользователь должен быть добавлен в список "Following"

Feature: Follow
  In order to receive the news that people are interested 
  As a registered user
  They want to add them to your list

 Scenario: Following
  Given that I am on the page the interesting user
  When I click on the "Follow" 
  Then that user should be added to the "Following" 

 
