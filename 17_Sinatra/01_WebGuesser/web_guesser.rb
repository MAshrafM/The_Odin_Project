require 'sinatra'
require 'sinatra/reloader'

@@secret_number = rand(0..100)
@@guess_remain = 5
@@state = nil

def check_guess(guess)
  if guess
    guess = guess.to_i
    if guess > @@secret_number
      "Too high!"
    elsif guess < @@secret_number
      "Too Low!"
    else
      redirect '/win'
    end
  else
    "Guess a Number between 0 - 100"
  end
end

def check_turn(guess)
  @@guess_remain -= 1
  if @@guess_remain < 1 && guess.to_i != @@secret_number
    redirect '/loss'
  end
end

def reset
  @@secret_number = rand(100)
  @@guess_remain = 5
end

get '/' do
  if @@state == :win || @@state == :loss
    reset
    @@state = nil
  end
  cheat = false
  guess = params[:guess]
  god = params[:god]
  if guess
    check_turn(guess)
  end
  if god
    cheat = true
  end
  message = check_guess(guess)
  erb :index, :locals => {:x => @@secret_number, :message => message, :guess_remain => @@guess_remain, :cheat => cheat}
end

get '/loss' do
  @@state = :loss
  erb :loss, :locals => {:x => @@secret_number}
  
end

get '/win' do
  @@state = :win
  erb :win, :locals => {:x => @@secret_number}
end