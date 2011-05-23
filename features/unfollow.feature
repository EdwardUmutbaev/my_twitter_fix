#Функционал: Перестать следить
#   Чтобы отписаться от новостей пользователя
#   Все авторизованные пользователи
#   Хотят удалять их из своего списка 

#  Сценарий: Отказ от слежки
#    Допустим я на странице интересующего пользователя
#    Если я нажимаю "Unfollow"
#    То этот пользователь должен быть удален из списка "Following"

Feature: Unfollow
  In order to unsubscribe from the news 
  As a registered user
  They want to delete them from your list 

 Scenario: Unfollowing
  Given that I am on the page the interesting user
  When I click on the "Unfollow" 
  Then that user should be deleted to the "Following" 
