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
    if 
      # @sender.valid? == false || @status == "complete"
      "Transaction rejected. Please check your account balance."
      @status = "rejected"
    else
    # self.valid? == true && @status == "pending"
      @sender.withdrawl(@amount)
      @receiver.deposit(@amount)
      @status = "complete"
    end 
    @status
  end 
  
end
