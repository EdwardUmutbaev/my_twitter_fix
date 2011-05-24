Feature: Unfollow
  In order to unsubscribe from the news 
  As a registered user
  They want to delete them from your list 

 Scenario: Unfollowing
  Given that I am on the page the interesting user
  When I click on the "Unfollow" 
  Then that user should be deleted to the "Following" 
