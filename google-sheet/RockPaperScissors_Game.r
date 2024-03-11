game <- function(rounds=3) {
  rounds <- as.integer(rounds)
  if (rounds>0) {
    username <- readline("What's your name? : ")
    print(paste("Hello ",username,", Welcome to the game!!"))
    print("You can choose 3 types like below")
    print(">> 1 or hammer or✊")
    print(">> 2 or scissors or✌️")
    print(">> 3 or paper or 🖐️")

    round <- 1
    your_score <- 0
    bot_score <- 0

    # dataset of choices
    df <- data.frame(
      id = as.character(1:3)
      ,name = c("hammer","scissors","paper")
      ,symbol = c("✊","✌️","🖐️")
    )

    # random bot
    hands <- 1:3
    flush.console()
    Sys.sleep(0.2)
    while ((round <= rounds)&(your_score <= rounds/2)&(bot_score <= rounds/2)){
      your_index <- numeric(0)
      draw_status <- TRUE
      print(paste("------ ROUND ",round," ------"))
      flush.console()
      Sys.sleep(0.2)
      while ((length(your_index) == 0)|(draw_status==TRUE)){
        your_hand <- tolower(readline("your hand is : "))
        your_index <- which((df$id == your_hand)|(df$name == your_hand)|(df$symbol == your_hand))
        if (length(your_index) == 0) {
          print("please, fill your hand agian")
          flush.console()
          Sys.sleep(0.2)
        } else {
          bot_index <- sample(hands,1)
          print(paste("bot hand is ",df[[2]][bot_index],df[[3]][bot_index]))
          flush.console()
          Sys.sleep(0.2)
          # game result
          ## when your_index and bot_index subtraction
          ## 2,-1 -> win
          ## -2,1 -> lose
          ## 0 -> draw
          val_result <- your_index - bot_index

          if ((val_result == 2)|(val_result == -1)) {
            print(paste("round ",round, " you win"))
            draw_status <- FALSE
            your_score = your_score +1
            flush.console()
            Sys.sleep(0.2)
          } else if ((val_result == -2)|(val_result == 1)) {
            print(paste("round ",round, " you lose"))
            draw_status <- FALSE
            bot_score = bot_score +1
            flush.console()
            Sys.sleep(0.2)
          } else {
            print("Draw!!, fill your hand agian")
            draw_status <- TRUE
            flush.console()
            Sys.sleep(0.2)
          }
        }
      }
      round = round+1
    }
    print("======= THE END OF THIS GAME =======")
    if (your_score > bot_score){
      print(paste(username," is winner!!"))
    } else if (your_score < bot_score){
      print("You lose!!")
    } else {
      print("Draw!!")
    }
  } else{
    print("rounds must more than 0")
  }
}
