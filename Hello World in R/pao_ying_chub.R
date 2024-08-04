## welcome to pao ying chub
## init data
sum_bot <- 0
sum_player <- 0
round_play <- 1
select_list <- data.frame(
  id = 1:3,
  short_name = c("h", "s", "p"),
  full_name = c("hammer", "scissor", "paper")
) 
## end init data

welcome_game <- function() {
  welcome_text <- "Welcome to pao ying chub\nWe play all 10 roundss"
  cat(welcome_text)
  play_status <- readline("Are you ready? [y/n] : ")
  play_status <- tolower(play_status)
  if (play_status == "y") {
    playing_game()
  } else if (play_status == "n") {
    thankyou_game()
  } else {
    print("Sorry, wrong selection please select again")
    welcome_game()
  }
}

playing_game <- function() {
  while(round_play <= 10) {
    print(paste0("Round : ", round_play))
    player_selected <- readline("Please choose your hand (hammer, scissor, paper) [h/s/p] : ")
    player_selected <- tolower(player_selected)
    if (player_selected %in% select_list$short_name) {
      print(paste0("Player Selected : ", player_selected))
      round_play <<- round_play + 1
      game_score(player_selected)
    } else {
      print("Sorry, wrong selection please select again")
      round_play <<- round_play
      playing_game()
    }
  }
  thankyou_game()
}

game_score <- function(player_selected) {
  # random index
  random_index <- sample(length(select_list), 1)
  
  # get value
  bot_selected <- select_list$short_name[random_index]
  print(paste0("Bot Selected : ", bot_selected))
  
    if ((bot_selected == "h" && player_selected == "s") ||
        (bot_selected == "s" && player_selected == "p") ||
        (bot_selected == "p" && player_selected == "h")
        ) { ## bot win
      print("Bot win!!!")
      sum_bot <<- sum_bot + 1
    } else if ((player_selected == "h" && bot_selected == "s") ||
               (player_selected == "s" && bot_selected == "p") ||
               (player_selected == "p" && bot_selected == "h")
    ) { ## player win
      print("Player win!!!")
      sum_player <<- sum_player + 1
    } else {
      print("Draw!!!")
    }
  print(paste0("Sum score : Bot = ", sum_bot, " , Player = ", sum_player))
}

thankyou_game <- function() {
  return("We appreciate your interest in our game.")
}