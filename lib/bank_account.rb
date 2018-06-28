class BankAccount
  attr_accessor :balance, :status 
  attr_reader :name 
  
  def initialize(name)
    @name = name 
    @balance = 1000
    @status = "open"
  end 
  
  def deposit(money)
    currency = money.to_i 
    @balance += currency
  end 
  
  def display_balance 
    "Your balance is $#{@balance}."
  end 
end
