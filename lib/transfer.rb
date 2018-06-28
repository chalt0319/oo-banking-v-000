require 'pry'
class Transfer
  attr_accessor :sender, :receiver, :amount, :status 
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver 
    @amount = amount 
    @status = "pending"
  end 
  
  def valid? 
    if @sender.valid? == true && @receiver.valid? == true 
      true 
    else 
      false 
    end 
  end 
  
  def execute_transaction
    if self.valid? == true && @status == "pending"
      @sender.withdrawl(@amount)
      @receiver.deposit(@amount)
      @status = "complete"
    else
      # @sender.valid? == false || @status == "complete"
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end 
  end 
  
  def reverse_transfer
    @sender.deposit(@amount)
    @receiver.withdrawl(@amount)
    @status = "reversed"
  end 
end
