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
      @status = "rejected"
    end 
  end 
end
