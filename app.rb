require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"

# Need this configuration for better_errors
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

get("/") do
  erb(:main)
end

get("/rock") do
  die = rand(1..3)
  if die == 1
    die = "rock"
  elsif die == 2
    die = "paper"
  else
    die = "scissors"
  end

  @outcome = "They played #{die}!"

  if die == "rock"
    result = "tied"
  elsif die == "paper"
    result = "lost"
  else
    result = "won"
  end

  @winner = "We #{result}!"
  
  erb(:rock)
end

get("/paper") do
  die = rand(1..3)
  if die == 1
    die = "rock"
  elsif die == 2
    die = "paper"
  else
    die = "scissors"
  end

  @outcome = "They played #{die}!"

  if die == "paper"
    result = "tied"
  elsif die == "scissors"
    result = "lost"
  else
    result = "won"
  end

  @winner = "We #{result}!"
  
  erb(:paper)
end

get("/scissors") do
  die = rand(1..3)
  if die == 1
    die = "rock"
  elsif die == 2
    die = "paper"
  else
    die = "scissors"
  end

  @outcome = "They played #{die}!"

  if die == "scissors"
    result = "tied"
  elsif die == "rock"
    result = "lost"
  else
    result = "won"
  end

  @winner = "We #{result}!"
  
  erb(:scissors)
end
